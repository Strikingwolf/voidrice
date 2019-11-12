# Defined in - @ line 1
function cpng --description 'alias cpng=xclip -selection clipboard -t image/png'
	xclip -selection clipboard -t image/png $argv;
end
