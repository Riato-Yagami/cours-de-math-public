function decimal_table(number)
    local num_str = tostring(number)
    local num_len = #num_str
    local result = {}
    
    num_str = string.rep("", 12 - num_len) .. num_str

    local classes = { 
        billions = num_str:sub(1, 3), 
        millions = num_str:sub(4, 6), 
        thousands = num_str:sub(7, 9), 
        units = num_str:sub(10, 12) 
    }
    tex.print("\\def\cW{1cm} \\def\\ccW{3cm}")
    tex.print("\\begin{tabular}{|M{\\cW}|M{\\cW}|M{\\cW}|M{\\cW}|M{\\cW}|M{\\cW}|M{\\cW}|M{\\cW}|M{\\cW}|M{\\cW}|M{\\cW}|M{\\cW}|}")
    tex.print("\\hline")
    tex.print("\\multicolumn{3}{|C{\\ccW}|}{Classe des milliards} & " ..
                            "\\multicolumn{3}{C{\\ccW}|}{Classe des millions} & " ..
                            "\\multicolumn{3}{C{\\ccW}|}{Classe des milliers} & " ..
                            "\\multicolumn{3}{C{\\ccW}|}{Classe des unités} \\\\")
    tex.print("\\hline")
    tex.print("c. & d. & u. & c. & d. & u. & c. & d. & u. & c. & d. & u. \\\\")
    tex.print("\\hline")
    tex.print(string.format("%s & %s & %s & %s & %s & %s & %s & %s & %s & %s & %s & %s \\\\", 
                    classes.billions:sub(1, 1), classes.billions:sub(2, 2), classes.billions:sub(3, 3),
                    classes.millions:sub(1, 1), classes.millions:sub(2, 2), classes.millions:sub(3, 3),
                    classes.thousands:sub(1, 1), classes.thousands:sub(2, 2), classes.thousands:sub(3, 3),
                    classes.units:sub(1, 1), classes.units:sub(2, 2), classes.units:sub(3, 3)))
    tex.print("\\hline")
    tex.print("\\end{tabular}")
end
