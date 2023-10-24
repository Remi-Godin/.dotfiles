return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup {
            direction = 'float',
            float_opts = {
                border = 'curved',
                width = 180,
                height = 40,
                winblend = 10,
                zindex = 1
            }
        }
        local keymap = vim.keymap
        keymap.set('n', '<leader>t', "<cmd>ToggleTerm<cr>", {})
        keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    end
}
