# Defined in /tmp/fish.30FuQP/getlast.fish @ line 2
function getlast
	find $PWD -type f -regex ".*/[0-9].*[\.tex|\.md]" | sort | tail -n1
end
