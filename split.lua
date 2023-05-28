local split = {}

function STT(str)
    local t={}
    str:gsub(".",function(c) table.insert(t,c) end)
    return t
end

function split.STT(str)
    local t={}
    str:gsub(".",function(c) table.insert(t,c) end)
    return t
end


function split:split(str, p)
    local t, stack, rt = STT(str), "", {}
    for i, char in ipairs(t) do
        if char == p then
            table.insert(rt, stack)
            stack = ""
        else
            stack = stack..char
        end
    end
    table.insert(rt, stack)
    return rt
end

function split.printT(t)
    for key, value in pairs(t) do
        print(string.format("[%s] = \"%s\"", tostring(key), tostring(value)))
    end
end

return split