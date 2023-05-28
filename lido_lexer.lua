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
            stack = char
            i = i + 1
        elseif char == "," then
            stack = char
            i = i + 1
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
        elseif char == "\n" then
            stack = char
            i = i + 1
        end
        table.insert(t, stack)
        stack = ""
    end

    i = 1
    local rt = {}
    while i <= #t do
        local s = t[i]
        local token = ""
        if s == " " then
            token = "00"
        elseif s == "/" then
            token = "01"
        elseif s == "\\" then
            token = "02"
        elseif s == "//" then
            token = "03"
        elseif s == "." then
            token = "04"
        elseif s == "," then
            token = "05"
        elseif s == "*" then
            token = "06"
        elseif s == "%" then
            token = "07"
        elseif s == "\n" then
            token = "ff"
        end
        table.insert(rt, token)
        i = i + 1
    end
    return rt
end

splitM.printT(lido_lexer.tokenization("// ... * ,,,\n// .. % ."))

return lido_lexer