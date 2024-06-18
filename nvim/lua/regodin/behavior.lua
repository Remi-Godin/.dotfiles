local autocmd_group = vim.api.nvim_create_augroup(
"Custom auto-commands",
{clear = true})

-- Autoformat
local autoformat_file_ext = {
    "*.go",
    "*.rs",
    "*.py",
    "*.c",
    "*.cpp",
--    "*.typ"
}

vim.api.nvim_create_autocmd({"BufWrite"},
{
    pattern = autoformat_file_ext,
    desc = "Auto format spacing after exiting insert mode",
    callback = function()
        -- Logic goes here
        --local cursor_pos = vim.api.nvim_win_get_cursor(0)
        --vim.api.nvim_input("ggvG=")
        --vim.api.nvim_win_set_cursor(cursor_pos, 0)
    end,
    group = autocmd_group,
})

-- Text wrapping
local textwrap_file_ext = {
    "*.md",
    "*.typ",
    --"*.txt"
}

vim.api.nvim_create_autocmd({"BufEnter"},
{
    pattern = textwrap_file_ext,
    desc = "Auto activate text wrapping on certain file format",
    callback = function()
        vim.api.nvim_set_option_value("textwidth", 80, { scope = "local"})
    end,
    group = autocmd_group,
})
