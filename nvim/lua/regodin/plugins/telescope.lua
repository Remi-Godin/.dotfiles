local M = {
    "nvim-telescope/telescope.nvim",
    version = "0.1.4",
    dependencies = "nvim-lua/plenary.nvim",
}

M.config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
    vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>tt', "<cmd>Telescope<CR>", {})
end

return M
