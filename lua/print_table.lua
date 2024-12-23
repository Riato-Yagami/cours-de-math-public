function print_table(number, max)
    tex.print("\\multiColItemize{3}{")  -- Start multi-column itemize environment
    for i = 1, max do
        tex.sprint("\\item $",
        number, " \\times ", i,
        " = \\nswr{",(number * i),"}$"
    )  -- Ensure everything is within $...$ for math mode
    end
    tex.print("}")  -- Close the multi-column environment
end
