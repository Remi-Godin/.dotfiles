require("regodin.set")
require("regodin.remap")
require("regodin.lazy")
require("regodin.behavior")

vim.o.background = "dark" -- or "light" for light mode

vim.cmd("let $PATH = '/home/regodin/.nvm/versions/node/v22.5.1/bin:' . $PATH")

vim.filetype.add({
    extension = {
        html = "html",
    },
})
