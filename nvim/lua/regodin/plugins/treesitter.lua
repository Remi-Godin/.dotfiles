local M = {
    "nvim-treesitter/nvim-treesitter",
}

M.config = function()
    require("nvim-treesitter.configs").setup {
        auto_install = true
    }
end

return M
