# Defined in /tmp/fish.cmgibj/rc-enable.fish @ line 2
function enable
	sudo ln -s /etc/runit/sv/$argv[1] /run/runit/service/$argv[1]
end
