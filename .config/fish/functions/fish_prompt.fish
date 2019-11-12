# Defined in /tmp/fish.JKS38B/fish_prompt.fish @ line 2
function fish_prompt --description 'Write out the prompt'
	if test -z $WINDOW
        printf '%s%s[%s%s%s@%s%s%s %s%s]%s ' (set_color red) (set_color -o) (set_color yellow) (whoami) (set_color green) (set_color blue) (prompt_hostname) (set_color purple) (basename (prompt_pwd)) (set_color red) (set_color normal)
    else
        printf '%s%s[%s%s%s@%s%s%s(%s)%s %s%s]%s ' (set_color red) (set_color -o) (set_color yellow) (whoami) (set_color green) (set_color blue) (prompt_hostname) (set_color white) (echo $WINDOW) (set_color purple) (basename (prompt_pwd)) (set_color red) (set_color normal)
    end
end
