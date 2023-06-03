local splitM = require("split")
local lido_lexer = require("lido_lexer")

local file = io.open("test.lido", "r")
io.input(file)
local str = io.read("a")
lido_lexer.parse(str)
io.close(file)