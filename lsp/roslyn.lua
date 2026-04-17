return {
    -- on_attach = function(client)
    --     print("csharp client attached")
    --     if client.is_hacked then
    --         return
    --     end
    --     client.is_hacked = true
    --
    --     -- let the runtime know the server can do semanticTokens/full now
    --     client.server_capabilities = vim.tbl_deep_extend("force", client.server_capabilities, {
    --         semanticTokensProvider = {
    --             full = true,
    --         },
    --     })
    --
    --     -- monkey patch the request proxy
    --     local request_inner = client.request
    --     function client:request(method, params, handler, req_bufnr)
    --         if method ~= vim.lsp.protocol.Methods.textDocument_semanticTokens_full then
    --             return request_inner(self, method, params, handler)
    --         end
    --
    --         local target_bufnr = vim.uri_to_bufnr(params.textDocument.uri)
    --         local line_count = vim.api.nvim_buf_line_count(target_bufnr)
    --         local last_line = vim.api.nvim_buf_get_lines(target_bufnr, line_count - 1, line_count, true)[1]
    --
    --         return request_inner(self, "textDocument/semanticTokens/range", {
    --             textDocument = params.textDocument,
    --             range = {
    --                 ["start"] = {
    --                     line = 0,
    --                     character = 0,
    --                 },
    --                 ["end"] = {
    --                     line = line_count - 1,
    --                     character = string.len(last_line) - 1,
    --                 },
    --             },
    --         }, handler, req_bufnr)
    --     end
    -- end,
    config = {
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
}
