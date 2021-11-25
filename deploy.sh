#!/bin/bash

help_text () {
	while IFS= read line; do
		printf "%s\n" "$line"
	done <<-EOF
	USAGE: $prog <query>
	 -h	 show this help text
	 -d	 remove container
	 -r	 start container
	EOF
}

while getopts 'hdr' OPT; do
	case $OPT in
		h)
			help_text
			exit 0
			;;
		d)
			docker stop dummyimage
      docker rm dummyimage
      docker image rm laijw/dummyimage:latest
		  exit 0
			;;
		r)
      docker build -t laijw/dummyimage:latest .
      docker run -itd --name dummyimage --restart always -p 8140:80 -v ~/WWW/laijw/dummyimage:/app laijw/dummyimage
		  exit 0
			;;
		*)
			help_text
			;;
	esac
done
