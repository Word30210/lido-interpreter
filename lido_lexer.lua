local splitM = require("split")

local lido_lexer = {}

function lido_lexer.tokenization(line)
    line = splitM.STT(line)
    local t = {}
    local i = 1
    local stack = ""
    local token = {}
    while i <= #line do
        local char = line[i]
        if char == "/" then
            while i <= #line and line[i] == "/" do
                stack = stack.."/"
                i = i + 1
            end
            if stack == "/" then
                token = { type = "VariableDeclaration", value = stack }
            elseif stack == "//" then
                token = { type = "print", value = stack }
            end
        elseif char == "." then
            local isnumber = line[i] == "," or line[i] == "." or line[i] == "*" or line[i] == "%"
            while i <= #line and isnumber do
                stack = stack..line[i]
                i = i + 1
                isnumber = line[i] == "," or line[i] == "." or line[i] == "*" or line[i] == "%"
            end
            token = { type = "number", value = stack }
        elseif char == "," then
            local isnumber = line[i] == "," or line[i] == "." or line[i] == "*" or line[i] == "%"
            while i <= #line and isnumber do
                stack = stack..line[i]
                i = i + 1
                isnumber = line[i] == "," or line[i] == "." or line[i] == "*" or line[i] == "%"
            end
            token = { type = "number", value = stack }
        elseif char == "*" then
            while i <= #line and line[i] == "*" do
                stack = stack.."*"
                i = i + 1
            end
            token = { type = "*", value = stack }
        elseif char == "%" then
            while i <= #line and line[i] == "%" do
                stack = stack.."%"
                i = i + 1
            end
            token = { type = "%", value = stack }
        elseif char == " " then
            stack = " "
            i = i + 1
            token = { type = "none", value = stack }
        elseif char == "\n" or char == "|" then
            stack = "|"
            i = i + 1
            token = { type = "line_end", value = stack }
        else
            i = i + 1
        end
        table.insert(t, token)
        stack = ""
    end
    return t
end

function  lido_lexer.parsing(token_table)
    local function lidonumber_to_number(lidonumber)
        local count = 0
        for i, v in ipairs(splitM.STT(lidonumber)) do
            if v == "." then count = count + 1
            elseif v == "," then count = count - 1
            end
        end
        return count
    end
    if #token_table == 0 then return end
    if token_table[1].value == "/" then --[[/<index: number> <value>]]
        local syntax = {"number", "none", "number"}
        for i, v in ipairs(syntax) do
            if token_table[i + 1].type == v then
                print("ezpz")
            else
                print(string.format([["%s": "%s" -> something: "%s"]], token_table[i + 1].value, token_table[i + 1].type, v))
            end
        end
    end
end



local tokens = lido_lexer.tokenization("/...*... ,,,")
lido_lexer.parsing(tokens)

return lido_lexer

--[[
    TODO: lido_lexer.parsing 만들으라 맨이야
]]