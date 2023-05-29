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
        end
        table.insert(t, stack)
        stack = ""
    end
    return t
end

splitM.printT(lido_lexer.tokenization("// ... * ,,,\n// .. % ."))

return lido_lexer