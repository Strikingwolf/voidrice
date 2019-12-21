# Defined in /tmp/fish.vGPHrr/ripytplaylistsAudio.fish @ line 2
function ripytplaylistsAudio
	set -l sep ";;<>:::<>;;"
	set -l artist $argv[1]

	mkdir $artist
	cd $artist
	set -l pwd $PWD

	echo $argv[2]
	ripytplaylists "$argv[2]" -i --extract-audio --audio-format mp3 -o "%(playlist_index)s-$sep%(title)s$sep.%(ext)s"

	addtagsyt $artist $sep
end
