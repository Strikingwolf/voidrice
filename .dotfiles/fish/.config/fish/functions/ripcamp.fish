function ripcamp
	set LST (wget -qO- https://$argv[1].bandcamp.com/music | grep -oP '(?<=album/).*?(?=&quot;)')
for i in $LST
mkdir $i
cd $i
echo "Downloading album '"$i"'"
youtube-dl -o "%(playlist_index)s-%(title)s.%(ext)s" https://$argv[1].bandcamp.com/album/$i
cd ..
end
end
