function proxyit
	ssh -D $argv[2] -f -q -N $argv[1]
end
