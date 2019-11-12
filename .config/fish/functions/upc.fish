# Defined in - @ line 1
function upc --description 'alias upc=sudo pacman -Syu; pkill -RTMIN+8 i3blocks'
	sudo pacman -Syu; pkill -RTMIN+8 i3blocks $argv;
end
