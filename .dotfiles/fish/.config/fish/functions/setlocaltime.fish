# Defined in /tmp/fish.o9Dg6n/setlocaltime.fish @ line 2
function setlocaltime --description 'alias setlocaltime=curl https://ipapi.co/timezone | xargs timedatectl set-timezone'
	curl https://ipapi.co/timezone | xargs sudo timedatectl set-timezone $argv;
end
