# Defined in /tmp/fish.4YMWHt/rm.fish @ line 2
function rm --wraps='rm -i' --wraps='rm -I' --description 'alias rm=rm -I'
 command rm -I $argv;
end
