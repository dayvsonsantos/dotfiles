#!/bin/bash

is_installed(){
	PKG_NAME=$1
	RESULT=$(sudo dnf history userinstalled | grep -i $PKG_NAME | wc -w)
	if [ "$RESULT" -gt "0" ]
	then
		return 1
	fi
	return 0
}

install_if_not_installed(){
	for pkg in $@
	do
		if is_installed $pkg -ne "1"
		then
			echo "installing ${pkg}"
			sudo dnf install -y ${pkg}
		else
			echo "$pkg already installed"
		fi
	done
}

# packages to be installed
PACKAGES="git vim tmux ranger rsync tree"

# update system
sudo dnf autoremove -y
sudo dnf clean all -y
sudo dnf update -y

# install packages if theses aren't installed
install_if_not_installed $PACKAGES

# make sync.sh executable if it isn't already
if ! [ -x sync.sh ]
then
	chmod +x sync.sh
fi

# installing diff-so-fancy
if ! [ -e /usr/bin/diff-so-fancy ]
then
	sudo curl https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy -o /usr/bin/diff-so-fancy
	sudo chmod +x /usr/bin/diff-so-fancy
	git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
fi

# sync .dotfiles from project to system directory
./sync.sh

# warning user
echo "Changes will be effective after logout"
