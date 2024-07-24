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

ls.add_snippets("go", {
    -- handlefunc
    s("hf", {
        t({"func "}),
        i(1),
        t({"(w http.ResponseWriter, r *http.Request) {","\t"}),
        i(2),
        t({"", "}", ""})
    })
})
