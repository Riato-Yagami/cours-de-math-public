local function base_decomposition(number, base)
    if base < 2 then
        return "Error: Base must be 2 or greater."
    end

    local result = {}
    local remainder

    -- Handle zero as a special case
    if number == 0 then
        return {0}
    end

    -- If the number is negative, store the sign and work with the absolute value
    local is_negative = number < 0
    number = math.abs(number)

    -- Perform the decomposition
    while number > 0 do
        remainder = number % base
        table.insert(result, 1, remainder)
        number = math.floor(number / base)
    end

    -- Add negative sign to each component if the original number was negative
    if is_negative then
        for i = 1, #result do
            result[i] = -result[i]
        end
    end

    return result
end

-- Define base-specific units dynamically
local function get_base_unit(base, index)
    if index == 0 then return "unité" end
    if base == 10 then
        if index == 1 then return "dizaine" end
        if index == 2 then return "centaine" end
        if index == 2 then return "millier" end
    end
    if base == 12 then
        if index == 1 then return "douzaine" end
        if index == 2 then return "grosse" end
    end
    return "$\\times\\;" .. base .. "^" .. (index).. "$"
end

function print_base_decomposition(number, base, show)
    show = show or "show"
    local awn_1 = "\\bawsr{"
    local awn_2 = "}"

    if show == "show" then
        awn_1 = ""
        awn_2 = ""
    end

    local result = base_decomposition(number, base)

    for i, digit in ipairs(result) do
        if digit > 0 then
            local unit = get_base_unit(base, #result - i)
            tex.sprint("$",awn_1,digit,awn_2,"\\;$", unit)
        end
        if digit > 0 and i < #result then
            tex.sprint("\\; + \\;")
        end
    end
end

-- Return the function so it can be used in other Lua files
return base_decomposition
