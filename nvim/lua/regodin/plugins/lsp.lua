local M = {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    }
}

M.config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
        ensure_installed = {
            "lua_ls",
            "gopls",
            "clangd",
            "rust_analyzer",
            "tsserver",
            "pyright",
            "html",
            "typst_lsp",
            "sqls",
        }
    })

    --local _capabilities = require('cmp_nvim_lsp').default_capabilities -- OLD LINE
    --This lines should make it so autocompleting functions also expands the parenthesis and parameters
    --local _capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
    local _capabilities = vim.lsp.protocol.make_client_capabilities()
    _capabilities.textDocument.completion.completionItem.snippetSupport = true
    _capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    }

    local goto_next_error_line = function ()
        local ec = #vim.diagnostic.count(0, {
            lnum = vim.api.nvim_win_get_cursor(0)[1]-1
        })
        if ec == 0 then
            vim.diagnostic.goto_next({
                float = {
                    float = true,
                    scope = "line",
                }
            })
        else
            vim.diagnostic.open_float()
        end
    end

    local on_attach = function(_, _)
        capabilities = _capabilities
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
        vim.keymap.set('n', '<leader>ch', vim.lsp.inlay_hint.enable, {})

        vim.keymap.set('n', 'gk', vim.diagnostic.goto_prev, {})
        vim.keymap.set('n', 'gj', goto_next_error_line, {})
        vim.keymap.set('n', 'gl', vim.diagnostic.open_float, {})
        vim.keymap.set('n', '<leader>gl', ":Telescope diagnostics<cr>", {buffer=0})

        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})

        vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})

        local _border = "rounded"
        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover, {
            border = _border
        }
        )
    end

    require('lspconfig').lua_ls.setup {
        on_attach = on_attach
    }
    require('lspconfig').rust_analyzer.setup {
        on_attach = on_attach
    }
    require('lspconfig').gopls.setup {
        on_attach = on_attach,
        completion = {
            callSnippet = "Both"
        },
        settings = {
            gopls = {
                completeUnimported = true,
                usePlaceholders = true,
                analyses = {
                    unusedarams = true,
                }
            }
        }
    }
    require('lspconfig').clangd.setup {
        on_attach = on_attach
    }
    require('lspconfig').tsserver.setup {
        on_attach = on_attach
    }
    require('lspconfig').pyright.setup {
        on_attach = on_attach
    }
    require('lspconfig').html.setup {
        on_attach = on_attach
    }
    require('lspconfig').jdtls.setup {
        on_attach = on_attach
    }
    require('lspconfig').typst_lsp.setup {
        on_attach = on_attach
    }
    require('lspconfig').wgsl_analyzer.setup {
        on_attach = on_attach
    }
    require('lspconfig').sqls.setup {
        on_attach = on_attach
    }
    require('lspconfig').html.setup {
        on_attach = on_attach,
        capabilities = _capabilities
    }
    require('lspconfig').cssls.setup {
        on_attach = on_attach,
        capabilities = _capabilities
    }
end

return M
