local M = {
    "nvim-treesitter/nvim-treesitter",
}

M.config = function()
    require("nvim-treesitter.configs").setup {
        auto_install = true,
        highlight = {
            enable = true,
        },
    }
end

return M
