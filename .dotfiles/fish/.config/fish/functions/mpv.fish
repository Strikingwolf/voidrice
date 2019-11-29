# Defined in - @ line 1
function mpv --description 'alias mpv=mpv --input-ipc-server=/tmp/mpvsoc(date +%s)'
	command mpv --input-ipc-server=/tmp/mpvsoc(date +%s) $argv;
end
