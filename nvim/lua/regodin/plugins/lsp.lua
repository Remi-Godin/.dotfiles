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
            "tsserver"
        }
    })

    local _capabilities = require('cmp_nvim_lsp').default_capabilities

    local on_attach = function(_, _)
        capabilities = _capabilities
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
        vim.keymap.set('n', '<leader>ch', vim.lsp.inlay_hint.enable, {})

        vim.keymap.set('n', 'gh', vim.diagnostic.goto_prev, {})
        vim.keymap.set('n', 'gl', vim.diagnostic.goto_next, {})
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
        on_attach = on_attach,
        cmd = {
            "rustup", "run", "stable", "rust-analyzer"
        }
    }
    require('lspconfig').gopls.setup {
        on_attach = on_attach,
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
end

return M
