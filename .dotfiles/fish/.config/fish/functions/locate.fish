# Defined in - @ line 1
function locate --wraps='locate -i -e' --description 'alias locate=locate -i -e'
 command locate -i -e $argv;
end
