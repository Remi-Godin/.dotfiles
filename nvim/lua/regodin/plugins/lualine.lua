local M = {
    "nvim-lualine/lualine.nvim"
}

local function getPath()
    return vim.api.nvim_buf_get_name(0)
end

local function lspStatus()
    return vim.lsp.status(0)
end

M.config = function()
    require('lualine').setup({
        sections = {
            lualine_c = {getPath},
            lualine_x = {'encoding', 'filetype'},
            lualine_z = {lspStatus}
        }
    })
end

return M
