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
local function get_base_unit(base, index, units)
    units = units or {}
    if #units == 0 then
        if base == 10 then units = {"unité", "dizaine", "centaine", "millier"} end
        if base == 12 then units = {"unité", "douzaine", "grosse"} end
        if base == 60 then units = {"unité", "soixantaine"} end
    end
    if index <= #units then
        return units[index+1]
    end
    return "$\\times\\;" .. base .. "^{" .. (index - 1) .. "}$"
end

function parse_seconds(number,show)
    print_base_decomposition(number, 60, show, {"\\second","\\minute","\\hour"})
end

function print_base_decomposition(number, base, show, units)
    units = units or {}
    show = show or "show"
    local awn_1 = "\\bawsr{"
    local awn_2 = "}"

    if show == "show" then
        awn_1 = ""
        awn_2 = ""
    end

    local result = base_decomposition(number, base)

    local last_non_zero_index = 0
    for i = #result, 1, -1 do
        if result[i] ~= 0 then
            last_non_zero_index = i
            break
        end
    end

    for i, digit in ipairs(result) do
        if digit > 0 then
            local unit = get_base_unit(base, #result - i, units)
            tex.sprint("$",awn_1,digit,awn_2,"\\;$",
            "\\textrm{",unit,(digit > 1 and units[1] ~= "\\second") and "s" or "","}"
            )
        end
        if digit ~= 0 and i < last_non_zero_index then
            tex.sprint("\\; + \\;")
        end
    end
end

-- Return the function so it can be used in other Lua files
return base_decomposition
