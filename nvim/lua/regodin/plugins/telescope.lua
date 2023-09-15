return {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.2',
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
        require("telescope").setup {}

        -- keymap
        local keymap = vim.keymap
        keymap.set('n', '<leader>ff', "<cmd>Telescope find_files<cr>", {})
        keymap.set('n', '<leader>fg', "<cmd>Telescope live_grep<cr>", {})
        keymap.set('n', '<leader>fb', "<cmd>Telescope buffers<cr>", {})
    end
}

