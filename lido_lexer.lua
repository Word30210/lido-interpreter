local splitM = require("split")

local lido_lexer = {}

function lido_lexer.tokenization(line)
    line = splitM.STT(line)
    local t = {}
    local i = 1
    local stack = ""
    while i <= #line do
        local char = line[i]
        if char == "/" then
            while i <= #line and line[i] == "/" do
                stack = stack.."/"
                i = i + 1
            end
        elseif char == "." then
            while i <= #line and line[i] == "." do
                stack = stack.."."
                i = i + 1
            end
        elseif char == "," then
            while i <= #line and line[i] == "," do
                stack = stack..","
                i = i + 1
            end
        elseif char == "*" then
            while i <= #line and line[i] == "*" do
                stack = stack.."*"
                i = i + 1
            end
        elseif char == "%" then
            while i <= #line and line[i] == "%" do
                stack = stack.."%"
                i = i + 1
            end
        elseif char == " " then
            while i <= #line and line[i] == " " do
                stack = stack.." "
                i = i + 1
            end
        elseif char == "\n" or char == "|" then
            stack = "|"
            i = i + 1
        else
            i = i + 1
        end
        table.insert(t, stack)
        stack = ""
    end
    return t
end

function  lido_lexer.parsing(token_table)
    local function is_number(str)
        
    end
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
    local headCommand = ""
    if token_table[1] == "/" then --[[/<index: number> <value>]]
        local syntax = {"number", "None", "number"}
        for i, v in ipairs(syntax) do
            
        end
    end
end



splitM.printT(lido_lexer.tokenization("//...*,,,"))

return lido_lexer

--[[
    TODO: lido_lexer.parsing 만들고
          is_number 만들어라 게이야
]]