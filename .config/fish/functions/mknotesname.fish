# Defined in /tmp/fish.C3Cx6N/mknotesname.fish @ line 2
function mknotesname
	set -l files (find $PWD -type f -name "*.tex")
	set -l name $argv[1]
	set -l outputtex "$PWD/$name.tex"
	set -l outputpdf "$PWD/$name.pdf"
	for file in $files
		if test "$file" != "$outputtex"
			compiler $file
			texclear $file
		end
	end
	set -l pdfs (find $PWD -type f -name "*.pdf" )
	echo "\\documentclass{article}" > $outputtex
	echo "\\usepackage{pdfpages}" >> $outputtex
	echo "\\begin{document}" >> $outputtex
	for pdf in $pdfs
		if test "$pdf" != "$outputpdf"
			echo "\\includepdf[pages=-]{$pdf}" >> $outputtex
		end
	end
	echo "\\end{document}" >> $outputtex
	compiler $outputtex
	texclear $outputtex
end
