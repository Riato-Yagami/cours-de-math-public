local base_decomposition = require("lua.base_decomposition")

function prehistoric(number)
    local result  -- Declare result variable

    -- Decompose the number if it's non-zero
    if number == 0 then
        result = {0, 0}  -- If the number is zero, set result to {0, 0}
    else
        result = base_decomposition(number, 12)  -- Decompose the number in base 12
    end

    -- Check the size of the result and output the corresponding LaTeX code
    if #result >= 2 then
        tex.print(
            "\\icon{prehistoric-numbers/d/" .. result[1] .. "} "
            .. "\\;"
            .. "\\icon{prehistoric-numbers/u/" .. result[2] .. "}"
        )
    elseif #result == 1 then
        tex.print(
            "\\icon{prehistoric-numbers/u/" .. result[1] .. "}"
        )
    end
end
