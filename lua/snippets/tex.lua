local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	s("mm", {
		t("\\("),
		i(1),
		t("\\)"),
	}, {
		priority = 1000,
	}),

	s("MM", {
		t({ "\\[", "    " }),
		i(1),
		t({ "", "\\]" }),
	}),

	s("sum", {
		t("\\sum_{"),
		i(1),
		t("}^{"),
		i(2),
		t("}"),
	}, {
		priority = 1000,
	}),
	s("bcup", {
		t("\\bigcup_{"),
		i(1),
		t("}^{"),
		i(2),
		t("}"),
	}, {
		priority = 1000,
	}),
	s("bcap", {
		t("\\bigcap_{"),
		i(1),
		t("}^{"),
		i(2),
		t("}"),
	}, {
		priority = 1000,
	}),
	s("set", {
		t("\\{"),
		i(1),
		t("\\}"),
	}, {
		priority = 1000,
	}),
	s("frac", {
		t("\\frac{"),
		i(1),
		t("}{"),
		i(2),
		t("}"),
	}, {
		priority = 1000,
	}),
	s("int", {
		t("\\int_{"),
		i(1),
		t("} "),
		i(2),
		t("\\, d"),
		i(3),
	}, {
		priority = 1000,
	}),
	s("seq", {
		t("("),
		i(1),
		t(")^{"),
		i(2),
		t("}_{"),
		i(3),
		t("}"),
	}, {
		priority = 1000,
	}),
}
