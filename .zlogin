# $Id: $HOME/.zlogin,v 1.1 2011/11/15 -tclover Exp $
#
# auto startx if logging in at VC/1
[[ -z $DISPLAY && ${(%):-%l} = 1 && $EUID != 0 ]] && startx &> $HOME/.xsession &
# start gnome-keyring
[[ -n $DISPLAY ]] && [[ -z $GNOME_KEYRING_PID ]] && {
	eval $(gnome-keyring-daemon)
	export GNOME_KEYRING_PID
	export GNOME_KEYRING_SOCKET
	export SSH_AUTH_SOCK
	export GPG_AGENT_INFO
}
#
# vim:fenc=utf-8:ci:pi:sts=0:sw=4:ts=4: