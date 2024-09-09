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
        formatters_by_ft = {
            go = { lsp_format = "first", "goimport", "golines" },
        }
    })
end

vim.api.nvim_create_autocmd("BufWrite", {
    pattern = "*",
    callback = function(args)
        require('conform').format({ bufnr = args.buf })
    end,
})


return M
