-- Autoformat the text between braces when adding a closing brace
vim.cmd[[
augroup AutoformatBraces
autocmd!
autocmd FileType * inoremap <buffer> } }<Esc>v%=%a
augroup END
]]

