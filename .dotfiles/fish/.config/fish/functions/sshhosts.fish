# Defined in - @ line 1
function sshhosts --description alias\ sshhosts=sed\ -rn\ \'s/\^\\s\*Host\\s+\(.\*\)\\s\*/\\1/ip\'\ \~/.ssh/config
	sed -rn 's/^\s*Host\s+(.*)\s*/\1/ip' ~/.ssh/config $argv;
end
