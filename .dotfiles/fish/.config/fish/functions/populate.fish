function populate
	for i in (alphabet $argv[2] $argv[3])
touch $argv[1]/$i.tex
end
end
