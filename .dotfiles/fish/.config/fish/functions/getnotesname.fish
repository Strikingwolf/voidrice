# Defined in /tmp/fish.PP9kfU/getnotesname.fish @ line 2
function getnotesname
	set -l name $argv[1]
	set -l outputtex "$PWD/$name.tex"
	set -l outputpdf "$PWD/$name.pdf"
	set -l pdfs (find $PWD -type f -name "*.pdf" | sort)
	echo "\\documentclass{article}" > $outputtex
	echo "\\usepackage{pdfpages}" >> $outputtex
	echo "\\begin{document}" >> $outputtex
	for pdf in $pdfs
		if test "$pdf" != "$outputpdf"
			echo "\\includepdf[pages=-]{$pdf}" >> $outputtex
		end
	end
	echo "\\end{document}" >> $outputtex
end
