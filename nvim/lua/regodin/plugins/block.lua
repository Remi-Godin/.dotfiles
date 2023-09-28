return {
    "HampusHauffman/block.nvim",
    enabled = false,
    config = function()
        require("block").setup({
            automatic = false,
        })
    end
}
