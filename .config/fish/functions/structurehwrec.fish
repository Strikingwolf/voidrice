function structurehwrec
	for i in (ls -1 $argv[1])
if test -d $argv[1]/$i
echo (space $argv[2])"\\item["$i".]"
echo (space $argv[2])"\\begin{enumerate}"
structurehwrec $argv[1]/$i (math $argv[2] + 2)
echo (space $argv[2])"\\end{enumerate}"
else
echo (space $argv[2])"\\item["(rootname $i)".]"
echo (space (math $argv[2] + 2))"\\problem{"$argv[1]/$i"}"
end
end
end
