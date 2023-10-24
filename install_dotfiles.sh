# If the source is a dir, then it needs to end with a slash
# To create a link of that dir in another dir, you write the path to where you
# want your linked dir to be at.
#
# If you want to link a file, the source does not end with a slash and neither does
# the destination.
if [ "$EUID" -ne 0 ]
then
    echo "Please run as root"
    exit 1
fi

read -p "This will delete all related directories and files from your local system. Continue? (Y/N)" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    cd
    rm -rf ~/.dotfiles
    rm -rf ~/.config/nvim
    rm -rf ~/.config/kitty

# Install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

# Install fancygit
curl -sS https://raw.githubusercontent.com/diogocavilha/fancy-git/master/install.sh | sh

# Install kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# Make kitty default
sudo update-alternatives --config x-terminal-emulator

# Get dotfiles from my repo
git clone https://github.com/Remi-Godin/.dotfiles.git

ln -sf ~/.dotfiles/.bashrc ~/.bashrc
ln -sf ~/.dotfiles/nvim/ ~/.config/
ln -sf ~/.dotfiles/kitty/ ~/.config/

fi
