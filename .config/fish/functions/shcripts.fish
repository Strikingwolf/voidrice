function shcripts
	for val in (find $argv[1])
		if test -f "$val"
			if test (head -1 "$val") = "#!/bin/bash"
				meow = $argv[1]
				function (basename $val) -V val -V meow
					bash $meow/$val
				end
			else if test (head -1 "$val") = "#!/bin/sh"
				function (basename $val)
					dash $argv[1]/$val
				end
			end
		else
			echo "entry: $val"
		end
	end
end
