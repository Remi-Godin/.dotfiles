return {
    "HampusHauffman/block.nvim",
    enabled = true,
    config = function()
        require("block").setup({
            automatic = false,
        })
    end
}
