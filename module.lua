--in real js, some of this differs because it counts from 0 while lua counts from 1, that should be the only difference between any of these functions...

local function escape(str)
    return str:gsub('([%.%^%$%(%)%%%[%]%^%*%+%-%?])', '%%%1')
end

--string functions
function string.charAt(str, pos)
    if pos < 0 then
        return ''
    else
        return string.sub(str, pos, pos)
    end
end

function string.startsWith(str, substr)
    local sub = string.sub(str, 1, #substr)
    return sub == substr
end

function string.endsWith(str, substr)
    local sub = string.sub(str, #str - #substr, #substr)
    return sub == ''
end

function string.includes(str, substr, pos)
    local found = string.find(str, substr, pos, true)
    if found then
        return true
    else
        return false
    end
end

function string.split(str, sep)
    local tb = {}

    str = escape(str)

    for part in string.gmatch(str, '([^' .. sep .. ']+)') do
        table.insert(tb, part)
    end

    return tb
end

function string.replace(str, old, new)
    return string.gsub(str, old, new, 1)
end

function string.replaceAll(str, old, new)
    return string.gsub(str, old, new)
end

function string.indexOf(str, substr, pos)
    local foundPos = string.find(str, substr, pos, true) --for some reason, if i return it directly, it returns two numbers... maybe im stupid
    if not foundPos then
        foundPos = -1
    end

    return foundPos
end

function string.search(str, substr, pos)
    local foundPos = string.find(str, substr, pos, false) --same deal as last comment
    if not foundPos then
        foundPos = -1
    end

    return foundPos
end

function string.padStart(str, amount, character)
    if not character then
        character = ' '
    end

    return (string.rep(character, amount - #str) .. str)
end

function string.padEnd(str, amount, character)
    if not character then
        character = ' '
    end

    return (str .. string.rep(character, amount - #str))
end

function string.trimStart(str)
    if not str:startsWith(' ') and not str:startsWith('\r') and not str:startsWith('\n') then return str end

    local spaces = 0
    for i = 1, #str do
        if str:charAt(i) == ' ' then
            spaces = spaces + 1
        else
            break
        end
    end

    str = str:slice(spaces + 1)

    return str
end

string.trimLeft = string.trimStart

function string.trimEnd(str)
    if not str:endsWith(' ') and not str:endsWith('\r') and not str:endsWith('\n') then return str end

    local spaces = 0
    for i = #str, 1, -1 do
        if str:charAt(i) == ' ' then
            spaces = spaces + 1
        else
            break
        end
    end

    spaces = -spaces

    str = str:slice(1, spaces - 1)

    return str
end

string.trimRight = string.trimEnd

function string.trim(str)
    str = str:trimStart()
    str = str:trimEnd()
    return str
end

function string.concat(str, sep, str2)
    return str .. sep .. str2
end

function string.repeat2(str, times)
    return string.rep(str, times)
end

function string.slice(str, pos1, pos2)
    return string.sub(str, pos1, pos2)
end

function string.toLowerCase(str)
    return string.lower(str)
end

function string.toUpperCase(str)
    return string.upper(str)
end

return {'mochastr applied to string metatable'}