# This is for nnn file manager
# ============================

alias nnn="nnn -dH"

export NNN_BMS="b:$HOME;e:$HOME/dev;d:$HOME/Documents;D:$HOME/Downloads/;v:$HOME/Videos;p:$HOME/Pictures;V:$HOME/OneDrive/OneSyncFiles/Home (Vault);x:/run/media/alfarizi;o:$HOME/OneDrive"
export NNN_PLUG='f:finder;o:fzopen;d:diffs;t:nmount;v:imgview;u:getplugs;p:preview-tui;D:dragdrop'
export NNN_FIFO='/tmp/nnn.fifo'

# export NNN_OPENER="$HOME/.config/nnn/nuke"

# Quit and then cd-ing it

n ()
{
	# Block nesting of nnn in subshells
	if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
		echo "nnn is already running"
		return
	fi

	# The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
	# To cd on quit only on ^G, either remove the "export" as in:
	#    NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
	#    (or, to a custom path: NNN_TMPFILE=/tmp/.lastd)
	# or, export NNN_TMPFILE after nnn invocation
	export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

	# Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
	# stty start undef
	# stty stop undef
	# stty lwrap undef
	# stty lnext undef

	nnn "$@"

	if [ -f "$NNN_TMPFILE" ]; then
			. "$NNN_TMPFILE"
			rm -f "$NNN_TMPFILE" > /dev/null
	fi

	# tmux for nnn
	if [ -n "$TMUX" ]; then
		nnn -a $@
	else
		tmux new-session nnn -a $@
	fi
}

#

nnn_cd()
{
	if ! [ -z "$NNN_PIPE" ]; then
		printf "%s\0" "0c${PWD}" > "${NNN_PIPE}" !&
	fi
}

trap nnn_cd EXIT
