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

-- Text wrapping
local textwrap_file_ext = {
    "*.md",
    "*.typ",
    "*.txt"
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
