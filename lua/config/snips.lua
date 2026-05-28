require("luasnip.loaders.from_vscode").lazy_load()

local ls = require('luasnip')

ls.add_snippets("html", {
    ls.parser.parse_snippet("html", "<!DOCTYPE html>\n<html>\n<head>\n    <title>${1:Title}</title>\n</head>\n<body>\n    ${0}\n</body>\n</html>"),
})
