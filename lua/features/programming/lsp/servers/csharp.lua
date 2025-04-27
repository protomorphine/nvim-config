---@class LineRange
---@field line integer
---@field character integer

---@class EditRange
---@field start LineRange
---@field end LineRange

---@class TextEdit
---@field newText string
---@field range EditRange

---@param edit TextEdit
local function apply_vs_text_edit(edit)
  local bufnr = vim.api.nvim_get_current_buf()
  local start_line = edit.range.start.line
  local start_char = edit.range.start.character
  local end_line = edit.range['end'].line
  local end_char = edit.range['end'].character

  local newText = string.gsub(edit.newText, "\r", "")
  local lines = vim.split(newText, "\n")

  local placeholder_row = -1
  local placeholder_col = -1

  -- placeholder handling
  for i, line in ipairs(lines) do
    local pos = string.find(line, '%$0')
    if pos then
      lines[i] = string.gsub(line, '%$0', '', 1)
      placeholder_row = start_line + i - 1
      placeholder_col = pos - 1
      break
    end
  end

  vim.api.nvim_buf_set_text(bufnr, start_line, start_char, end_line, end_char, lines)

  if placeholder_row ~= -1 and placeholder_col ~= -1 then
    local win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_cursor(win, { placeholder_row + 1, placeholder_col })
  end
end

require("roslyn").setup({
    config = {
        capabilities = {
            semanticTokensProvider = {
                full = true,
                range = true,
            },
            textDocument = {
                _vs_onAutoInsert = { dynamicRegistration = false },
            },
        },
        handlers = {
            ["textDocument/hover"] = function(err, result, ctx, config)
                if result and result.contents and result.contents.value then
                    result.contents.value = result.contents.value:gsub("\\([^%w])", "%1")
                end

                vim.lsp.handlers["textDocument/hover"](err, result, ctx, config)

                local parsed = require("pretty_hover.parser").parse(result)
                vim.lsp.util.open_floating_preview(parsed.text, "markdown", {
                    focus = true,
                    focusable = true,
                    wrap = true,
                    wrap_at = 100,
                    max_width = 100,
                    border = "rounded",
                    focus_id = "pretty-hover-example",
                })
            end,
            ['textDocument/_vs_onAutoInsert'] = function(err, result, _)
                if err or not result then
                    return
                end
                apply_vs_text_edit(result._vs_textEdit)
            end,
        },
        settings = {
            ["csharp|inlay_hints"] = {
                csharp_enable_inlay_hints_for_implicit_object_creation = true,
                csharp_enable_inlay_hints_for_implicit_variable_types = true,
                csharp_enable_inlay_hints_for_lambda_parameter_types = true,
                csharp_enable_inlay_hints_for_types = true,
                dotnet_enable_inlay_hints_for_indexer_parameters = true,
                dotnet_enable_inlay_hints_for_literal_parameters = true,
                dotnet_enable_inlay_hints_for_object_creation_parameters = true,
                dotnet_enable_inlay_hints_for_other_parameters = true,
                dotnet_enable_inlay_hints_for_parameters = true,
                dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
                dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
                dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
            },
            ["csharp|code_lens"] = {
                dotnet_enable_references_code_lens = true,
            },
            ["csharp|symbol_search"] = {
                dotnet_search_reference_assemblies = true,
            },
            ["csharp|completion"] = {
                dotnet_provide_regex_completions = true,
                dotnet_show_completion_items_from_unimported_namespaces = true,
                dotnet_show_name_completion_suggestions = true,
            },
            ["csharp|background_analysis"] = {
                dotnet_analyzer_diagnostics_scope = "fullSolution",
                dotnet_compiler_diagnostics_scope = "fullSolution",
            },
        },
    },
})
