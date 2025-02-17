require("lua.hide")

function decimal_table(numbers, show)
    show = show or "show"
    tex.print("\\def\\cW{0.6cm} \\def\\ccW{1.8cm}")
    tex.print("\\begin{center}")
    tex.print("\\begin{tabular}{|M{\\cW}|M{\\cW}|M{\\cW}|M{\\cW}|M{\\cW}|M{\\cW}|M{\\cW}|M{\\cW}|M{\\cW}|M{\\cW}|M{\\cW}|M{\\cW}|}")
    tex.print("\\hline")
    tex.print("\\multicolumn{3}{|C{\\ccW}|}{Classe des milliards} & " ..
    "\\multicolumn{3}{C{\\ccW}|}{Classe des millions} & " ..
    "\\multicolumn{3}{C{\\ccW}|}{Classe des milliers} & " ..
    "\\multicolumn{3}{C{\\ccW}|}{Classe des unités} \\\\")
    tex.print("\\hline")
    tex.print("c. & d. & u. & c. & d. & u. & c. & d. & u. & c. & d. & u. \\\\")
    tex.print("\\hline")

    -- Ajouter chaque nombre du tableau `numbers` comme une ligne dans la table
    for _, number in ipairs(numbers) do
        local num_str = string.format("%12d", number):gsub(" ", "") -- Convertir en chaîne alignée à droite sans espaces.
        num_str = string.rep(" ", 12 - #num_str) .. num_str -- Ajouter des espaces à gauche pour obtenir une chaîne de 12 caractères.

        local classes = {
            billions = num_str:sub(1, 3), 
            millions = num_str:sub(4, 6), 
            thousands = num_str:sub(7, 9), 
            units = num_str:sub(10, 12) 
        }

        -- Afficher la ligne pour le nombre actuel
        tex.print(string.format("%s & %s & %s & %s & %s & %s & %s & %s & %s & %s & %s & %s \\\\", 
                        hide(classes.billions:sub(1, 1), show), hide(classes.billions:sub(2, 2), show), hide(classes.billions:sub(3, 3), show),
                        hide(classes.millions:sub(1, 1), show), hide(classes.millions:sub(2, 2), show), hide(classes.millions:sub(3, 3), show),
                        hide(classes.thousands:sub(1, 1), show), hide(classes.thousands:sub(2, 2), show), hide(classes.thousands:sub(3, 3), show),
                        hide(classes.units:sub(1, 1), show), hide(classes.units:sub(2, 2), show), hide(classes.units:sub(3, 3), show)))
        tex.print("\\hline")
    end
    
    tex.print("\\end{tabular}")
    tex.print("\\end{center}")
end
