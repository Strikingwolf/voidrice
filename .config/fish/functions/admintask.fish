# Defined in - @ line 1
function admintask --description alias\ admintask=pandoc\ vimwiki/Admin\\\ Tasks.md\ -o\ /tmp/admin.pdf\ \&\&\ zathura\ /tmp/admin.pdf
	pandoc vimwiki/Admin\ Tasks.md -o /tmp/admin.pdf && zathura /tmp/admin.pdf $argv;
end
