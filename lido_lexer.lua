local splitM = require("split")

local lido_lexer = {}

local tokens = {
    functions = {
        ["SetToken"] = "^%s*/[%.%,%*%%]+%s+[%w%p]+";
        ["CallToken"] = "^%s*\\([%.%,%*%%]+)\\";
        ["PrintToken"] = "^%s*%/%/(.+)";
    },
    dataType = {
        ["NumberToken"] = "^%s*([%.%,%*%%]+)%s*";
        ["StringToken"] = "^%s*[\"'][%s%w%p]*[\"']";
    }
    -- ["WhitespaceToken"] = "^%s+";
}

function lido_lexer.parse(str)
    local lines = splitM.split(str, "\n")
    for i, v in ipairs(lines) do
        
    end
end

-- Tset Code
local user_input = io.read("l")
local match = string.match(user_input, tokens)
if match then
    print(string.format("true | value: %s", match))
else
    print(string.format("false | value: %s", user_input))
end