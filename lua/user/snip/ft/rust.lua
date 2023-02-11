
local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt


return {

    s("mma", c(1, {
        fmt(
        [[{} => {}]],
        { i(1), i(2) }
        ),
        fmt(
        [[Some({}) => {}]],
        { i(1,"x"), i(2) }
        ),
        fmt(
        [[None => {}]],
        { i(1) }
        ),
        fmt(
        [[_ => {}]],
        { i(1) }
        )
    })),

    s("modtest", fmt(
    [[
    #[cfg(test)]
    mod {} {{
        use super::*;
        {}
    }}{}
    ]],
    { i(1, "name"), i(2), i(0) }
    )),

    s("fn", fmt(
    [[
    fn {}({}){} {{
        {}
        todo!()
    }}{}
    ]],
    { i(1, "name"), i(2), i(3), i(4, "Your code here ..."), i(0) }
    )),

    s("struct", fmt(
    [[
    struct {} {{
        {}
    }}{}
    ]],
    {
        i(1, "name"),
        i(2),
        i(0)
    }
    )),

    s("impl", fmt(
    [[
    impl {} {{
        {}
    }}{}
    ]],
    {
      i(1, "name"),
      i(2),
      i(0)
    }
    )),

    s("output", { t("-> ") }),
    s("mut", { t("&mut ") })
}

