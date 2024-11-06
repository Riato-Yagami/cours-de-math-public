-- lua/base_decomposition.lua

local function base_decomposition(number, base)
    if base < 2 then
        return "Error: Base must be 2 or greater."
    end

    local result = {}
    local power = 1  -- Start with base^0
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
        power = power * base  -- Increase the power of the base
    end

    -- Add negative sign to each component if the original number was negative
    if is_negative then
        for i = 1, #result do
            result[i] = -result[i]
        end
    end

    return result
end

-- Return the function so it can be used in other Lua files
return base_decomposition