#!/bin/sh

if command -v wl-copy > /dev/null; then
	wl-copy
elif command -v xclip > /dev/null; then
	xclip -selection clipboard
elif command -v pbcopy > /dev/null; then
	pbcopy
else 
	# Flush stdin and fallback to tmux internal buffer 
	# if using from remote and want the text, just manually select and copy the normal way
	cat > /dev/null
fi
