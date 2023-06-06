local parsedCode = {}

local tokens = {
    ["setToken"] = "/([%.%,%*%%]+)[\t\n\32]+([%.%,%*%%]+)";
    ["printToken"] = "//([%w%p]+)";
}

local function ln_tonumber(str)
    local t = {}
    local count = 0
    str:gsub(".",function(c) table.insert(t,c) end)
    for i, v in ipairs(t) do
        if v == "." then count = count + 1
        elseif v == "," then count = count - 1 end
    end
    return count
end

while true do
    local userInput = io.read()
    if userInput == nil then
        print("exit")
        break
    end

    for tokenType, tokenMatch in pairs(tokens) do
        local value1, value2 = string.match(userInput, tokenMatch)
        if value1 then
            if tokenType == "setToken" then
                -- print(string.format("index: \"%s\" | value: \"%s\"", value1, value2))
                local parsedCodeLine = string.format("SET %d %d", ln_tonumber(value1), ln_tonumber(value2))
                table.insert(parsedCode, parsedCodeLine)
                print(parsedCodeLine)
            elseif tokenType == "printToken" then
                -- print(string.format("print: \"%s\"", value1))
                local parsedCodeLine = string.format("PRINT %d", ln_tonumber(value1))
                table.insert(parsedCode, parsedCodeLine)
                print(parsedCodeLine)
            end
        end
    end
end