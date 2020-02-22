# Defined in /tmp/fish.oET6fS/addtagsyt.fish @ line 2
function addtagsyt
	set -l artist $argv[1]
	set -l sep $argv[2]
	set -l pwd $PWD
	set -l run (printf "Yes\nNo" | $MENU -p "Run This Program in $PWD ?")

	if test run = "No"
		exit
	end

	for file in (find . -name "*.mp3")
		set -l album (echo $file | sed "s|.*\./||" | sed "s|/.*||")
		set -l filename (basename $file)
		set -l title (echo $filename | sed -e "s/.*$sep\(.*\)$sep.*/\1/" | sed "s/\.mp3//")

		id3v2 -a $artist -A $album -t $title $file
		mv $file (echo $file | sed "s/$sep//g")
	end
end
