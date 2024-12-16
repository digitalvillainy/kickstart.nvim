local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- PHP snippets
ls.add_snippets("php", {
  s("vdd", {
    t("echo '<pre/>';"),
    t({ "", "var_dump(" }), i(1, "variable"), t(");"),
    t({ "", "die();" }), i(2),
  }),
})

