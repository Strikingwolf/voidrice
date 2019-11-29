function structurehw
	echo "\\begin{enumerate}"
for i in (ls -1 problems)
if test -d "problems/"$i
echo "  \\item["$i".]"
echo "  \\begin{enumerate}"
structurehwrec "problems/"$i 4
echo "  \\end{enumerate}"
else
echo "  \\item["(rootname $i)".]"
echo "    \\problem{problems/"$i"}"
end
end
echo "\\end{enumerate}"
end
