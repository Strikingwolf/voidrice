# Defined in /tmp/fish.UwenaB/rc-disable.fish @ line 1
function disable
	sudo rm /run/runit/service/$argv[1]
end
