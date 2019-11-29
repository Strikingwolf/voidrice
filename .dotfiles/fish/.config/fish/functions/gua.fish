# Defined in - @ line 1
function gua --description 'alias gua=git remote | xargs -L1 git push --all'
	git remote | xargs -L1 git push --all $argv;
end
