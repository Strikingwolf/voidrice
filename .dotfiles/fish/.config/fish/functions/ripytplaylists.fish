# Defined in /tmp/fish.fUW1Lx/ripytplaylists.fish @ line 2
function ripytplaylists
	set -l pwd $PWD
	set -l basicpage (curl $argv[1] | grep 'playlist?list')
	set -l passargs $argv[2..1000]
	for listtext in $basicpage
		set -l album (echo $listtext | grep -oE 'title=".*"' | sed 's/title="//' | sed 's/".*//')
		set -l endlink (echo $listtext | sed '0,/href="/ s/^.*href="//' | sed 's/".*//')

		if test ! -d $pwd/$album
			mkdir $pwd/$album
		end
		cd $pwd/$album

		printf "\nStarting $album !\n"

		youtube-dl $passargs "youtube.com$endlink"

		cd $pwd

		printf "\nFinished $album !\n"
	end
end
