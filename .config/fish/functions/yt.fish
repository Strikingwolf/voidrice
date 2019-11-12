# Defined in - @ line 1
function yt --description alias\ yt=youtube-dl\ --add-metadata\ -i\ -o\ \'\%\(upload_date\)s-\%\(title\)s.\%\(ext\)s\'
	youtube-dl --add-metadata -i -o '%(upload_date)s-%(title)s.%(ext)s' $argv;
end
