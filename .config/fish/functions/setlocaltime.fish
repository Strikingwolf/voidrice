# Defined in - @ line 1
function setlocaltime --description 'alias setlocaltime=curl https://ipapi.co/timezone | xargs timedatectl set-timezone'
	curl https://ipapi.co/timezone | xargs timedatectl set-timezone $argv;
end
