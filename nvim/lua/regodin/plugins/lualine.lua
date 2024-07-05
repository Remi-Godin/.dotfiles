local M = {
    "nvim-lualine/lualine.nvim"
}

local function getPath()
    -- Max len for the displayed path
    local max_len = 70
    -- Logic to cut off the value at either the first occuring '/' in the substring or at len-max_len
    local path = vim.api.nvim_buf_get_name(0)
    if path.len(path) > max_len then
        local start = string.find(path, '/', string.len(path) - max_len, true)
        print(start)
        if start ~= nil then
            return string.format("...%s", string.sub(path, start, string.len(path)))
        end
        return string.format("...%s", string.sub(path, string.len(path)-max_len, string.len(path)))
    end
    -- If path is not longer than max_len, just return the full path
    return path
end

M.config = function()
    require('lualine').setup({
        sections = {
            lualine_c = { getPath },
            lualine_x = {'encoding', 'filetype'},
        }
    })
end

return M
