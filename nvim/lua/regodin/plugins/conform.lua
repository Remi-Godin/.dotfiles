local M = {
    "stevearc/conform.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
}

M.config = function ()
    require('conform').setup({
        format_after_save = {
            lsp_fallback = false,
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
        formatters_by_ft = {
            go = { lsp_format = "first", "goimports", "golines" },
            rust = { lsp_format = "rustfmt" }
        }
    })
end


return M
