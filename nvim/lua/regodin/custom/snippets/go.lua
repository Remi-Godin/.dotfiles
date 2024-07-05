local ls = require("luasnip")
local i = ls.insert_node
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("go", {
    -- if err != nil
    s("ernil", {
        t({"if err != nil {", "\t"}),
        i(1),
        t({"", "}", ""}),
        i(0),
    })
})

