# HOME="/home/$USER"
echo "Setting up config on $HOME"

COMPUTER="think"
PATH="$HOME/workspace/archlinux-stuff
LNPre="ln -s -f $PATH/config"
$LNPre/i3/ ~/.config/
$LNPre/i3blocks/ ~/.config/
$LNPre/zathura/ ~/.config/
sudo ln -s /usr/lib/i3blocks /usr/share/i3blocks # Compatibility between arch and Ubuntu
$LNPre/vim/.vimrc ~/
$LNPre/vim/.ctags ~/
$LNPre/vim/syntax ~/.vim/
$LNPre/xmodmap/.xmodmap ~/
$LNPre/xresources/.Xresources.$COMPUTER ~/.Xresources
$LNPre/xresources/.Xresources.d .
$LNPre/R/.Rprofile ~/
$LNPre/.profile ~/
$LNPre/w3m/keymap ~/.w3m/
$LNPre/bash/.bashrc ~/
$LNPre/bash/.extend.bashrc ~/
$LNPre/bash/.inputrc ~/

sudo cp $PATH/tlp/tlp /etc/default/tlp

# Link screen config
# $LNPRE/scripts/configScreens.sh /usr/local/bin/
sudo cp $PATH/scripts/configScreens.sh /usr/local/bin 

echo "Warning: linked /usr/local/bin/configScreens.sh but it needs to be configured.\
        In the display manager. E.g. /etc/lightdm/lightdm.conf."


echo "Done"
