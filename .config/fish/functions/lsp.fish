# Defined in - @ line 1
function lsp --description 'alias lsp=pacman -Qett --color=always | less'
	pacman -Qett --color=always | less $argv;
end
