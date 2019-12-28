# Defined in /tmp/fish.UwenaB/rc-disable.fish @ line 1
function rc-disable
	rm /run/runit/service/$argv[1]
end
