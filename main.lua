local splitM = require("split")

local file = io.open("test.lido", "r")
io.input(file)
local str = io.read("a")
splitM.printT(splitM:split(str, "\n"))
io.close(file)