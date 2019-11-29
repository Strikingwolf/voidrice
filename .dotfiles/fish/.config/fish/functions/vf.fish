function vf
	fzf | xargs -r -I % $EDITOR %
end
