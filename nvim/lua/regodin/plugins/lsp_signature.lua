local M = {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
        require("lsp_signature").setup(opts)
    end
}

M.config = function()
    local cfg = {}
    require("lsp_signature").setup(cfg)
end

return M
