local ls = require "luasnip"
return {
	ls.parser.parse_snippet("table","<!-- Table -->\n$1\n<!-- Table -->$0"),
	ls.parser.parse_snippet("rlink","[$1][$2]$3"),
}
