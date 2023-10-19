return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup {}
        local keymap = vim.keymap
        keymap.set('n', '<leader>tt', "<cmd>ToggleTerm<cr>", {})
    end
}
