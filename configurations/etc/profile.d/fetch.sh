if [ -x "/usr/bin/fastfetch" ]; then
	fastfetch
     elif [ -x "/usr/bin/neofetch" ]; then
	neofetch
     else
        uname -a
fi;
