local M = {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" }
}

M.config = function()
    require("oil").setup({
        default_file_explorer = false,
        columns = {
            "icon",
            "permissions",
        },
    })
    vim.api.nvim_set_keymap("n", "<leader>oi", "<cmd>lua require('oil').open_float(\".\")<CR>", { noremap = true, silent = true })
end

return M
