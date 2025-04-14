-- refresh diagnostic
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    pattern = "*",
    callback = function()
        local clients = vim.lsp.get_clients({ name = "roslyn" })
        if not clients or #clients == 0 then
            return
        end

        local buffers = vim.lsp.get_buffers_by_client_id(clients[1].id)
        for _, buf in ipairs(buffers) do
            vim.lsp.util._refresh("textDocument/diagnostic", { bufnr = buf })
        end
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf ---@type number
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client == nil then
            return
        end

        local utils = require("features.programming.lsp.utils")
        local mappings = require("features.programming.lsp.mappings")

        if client.name == "roslyn" then
            mappings.add_dotnet_specific_mappings()
        end

        mappings.add_lsp_mappings(bufnr)

        vim.lsp.inlay_hint.enable(true)

        utils.configure_format_on_save(client, bufnr)
        utils.monkey_patch_semantic_tokens(client)

        require("virtualtypes").on_attach()
    end,
})
