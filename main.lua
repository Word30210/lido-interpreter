

local tokens = {
    ["setToken"] = "/([%.%,%*%%]+)[\t\n\32]+([%.%,%*%%]+)";
    ["printToken"] = "//([%w%p]+)";
}

while true do
    local userInput = io.read()
    if userInput == nil then
        print("exit")
        break
    end

    for tokenType, tokenMatch in pairs(tokens) do
        local matchedString = string.match(userInput, tokenMatch)
        if matchedString then
            local value1, value2 = string.match(userInput, tokenMatch)
            if tokenType == "setToken" then
                print(string.format("index: \"%s\" | value: \"%s\"", value1, value2))
            elseif tokenType == "printToken" then
                print(string.format("print: \"%s\"", value1))
            end
        end
    end
end