function totalmusic
	find $PWD -name "*.mp3" -exec mp3info -p "%S\n" {} \; | awk 'BEGIN { s = 0 }; {s = s + $1;  if(FNR % 10 == 0) { printf "Processed %d mp3s\n", FNR  }}; END { print s }';
end
