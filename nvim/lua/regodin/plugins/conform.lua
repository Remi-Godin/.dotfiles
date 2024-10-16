local M = {
    "stevearc/conform.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
}

M.config = function()
    require('conform').setup({
        format_after_save = {
            lsp_fallback = false,
        },
        format_on_save = function(bufnr)
            -- Disable autoformat on certain filetypes
            local ignore_filetypes = { "sql", "java" }
            if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
                return
            end
            -- Disable with a global or buffer-local variable
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                return
            end
            -- Disable autoformat for files in a certain path
            local bufname = vim.api.nvim_buf_get_name(bufnr)
            if bufname:match("/node_modules/") then
                return
            end
            -- ...additional logic...
            return { timeout_ms = 500, lsp_format = "fallback" }
        end,
        formatters_by_ft = {
            go = { lsp_format = "first", "goimports", "golines" },
            rust = { lsp_format = "rustfmt" },
            --html = { "prettier" }
        }
    })
end


return M
