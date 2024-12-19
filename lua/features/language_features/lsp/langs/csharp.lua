local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").omnisharp.setup({
    capabilities = capabilities,
    cmd = {
        vim.fn.stdpath("data") .. "/mason/bin/omnisharp",
        "-z",
        "--hostPID",
        tostring(vim.fn.getpid()),
        "DotNet:enablePackageRestore=false",
        "--encoding",
        "utf-8",
        "--languageserver",
        "FormattingOptions:EnableEditorConfigSupport=true",
        "FormattingOptions:OrganizeImports=true",
        "RoslynExtensionsOptions:enableDecompilationSupport=true",
        "RoslynExtensionsOptions:EnableAnalyzersSupport=true",
        "RoslynExtensionsOptions:EnableImportCompletion=true",
        "RoslynExtensionsOptions:inlayHintsOptions:enableForParameters=true",
        "RoslynExtensionsOptions:inlayHintsOptions:forLiteralParameters=true",
        "RoslynExtensionsOptions:inlayHintsOptions:forIndexerParameters=true",
        "RoslynExtensionsOptions:inlayHintsOptions:forObjectCreationParameters=true",
        "RoslynExtensionsOptions:inlayHintsOptions:forOtherParameters=true",
        "RoslynExtensionsOptions:inlayHintsOptions:suppressForParametersThatDifferOnlyBySuffix=true",
        "RoslynExtensionsOptions:inlayHintsOptions:suppressForParametersThatMatchMethodIntent=true",
        "RoslynExtensionsOptions:inlayHintsOptions:suppressForParametersThatMatchArgumentName=true",
        "RoslynExtensionsOptions:inlayHintsOptions:enableForTypes=true",
        "RoslynExtensionsOptions:inlayHintsOptions:forImplicitVariableTypes=true",
        "RoslynExtensionsOptions:inlayHintsOptions:forLambdaParameterTypes=true",
        "RoslynExtensionsOptions:inlayHintsOptions:forImplicitObjectCreation=true",
        "Sdk:IncludePrereleases=true",
    },
})

-- vim.lsp.inlay_hits.enable(true)
