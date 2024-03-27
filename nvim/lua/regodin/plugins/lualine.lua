local M = {
    "nvim-lualine/lualine.nvim"
}

local function getPath()
    return vim.api.nvim_buf_get_name(0)
end

M.config = function()
    require('lualine').setup({
        sections = {
            lualine_c = {getPath},
            lualine_x = {'encoding', 'filetype'},
        }
    })
end

return M
