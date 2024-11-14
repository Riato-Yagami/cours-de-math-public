function hide(str,state)
    local awn_1 = "\\bawsr{"
    local awn_2 = "}"

    if state == "" then
        awn_1 = ""
        awn_2 = ""
    end
    
    return awn_1 .. str .. awn_2
end