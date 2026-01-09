vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.HINT] = '󰌶',
            [vim.diagnostic.severity.INFO] = '',
            [vim.diagnostic.severity.WARN] = '󰇻'
        },
    },
    update_in_insert = true,
    severity_sort = true,
})
