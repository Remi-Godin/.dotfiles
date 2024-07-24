vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)

-- Remap window controls
vim.api.nvim_set_keymap('n', '<leader>w', '<C-W>', { noremap = false, silent = true })
