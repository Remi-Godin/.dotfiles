return {
    'mfussenegger/nvim-dap',
    config = function()
        -- keymap
        local keymap = vim.keymap
        keymap.set('n', '<leader>b', "<cmd>lua require'dap'.toggle_breakpoint()<cr>", {})
        keymap.set('n', '<leader>db', "<cmd>lua require'dap'.continue()<cr>", {})
        keymap.set('n', '<leader>do', "<cmd>lua require'dap'.step_over()<cr>", {})
        keymap.set('n', '<leader>di', "<cmd>lua require'dap'.step_into()<cr>", {})
    end
}
