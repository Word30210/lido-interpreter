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
    if #token_table > 0 then
        
    end
end



splitM.printT(lido_lexer.tokenization("//...*,,,"))

return lido_lexer