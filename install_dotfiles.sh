# If the source is a dir, then it needs to end with a slash
# To create a link of that dir in another dir, you write the path to where you
# want your linked dir to be at.
#
# If you want to link a file, the source does not end with a slash and neither does
# the destination.
read -p "This will delete all related directories and files from your local system. Continue? (Y/N)" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt-get update
    sudo apt-get install curl
    # Delete current files and folders
    echo "Deleting default directories..."
    cd
    rm -rf ~/.config/nvim
    rm -f ~/.fancy-git/app_config

    # Create missing folders
    echo "Creating missing directories..."
    mkdir -p ~/Programming/Repos/practice
    mkdir -p ~/Programming/Repos/projects
    mkdir -p ~/Programming/Repos/school
    mkdir -p ~/.config
    mkdir -p ~/.local/bin

    # Install lazygit
    echo "Installing lazygit..."
    if ! command -v lazygit &> /dev/null
    then
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit /usr/local/bin
    else
        echo "Lazygit already exists..."
    fi

    # Install fancygit
    echo "Installing fancygit"
    if ! command -v fancygit &> /dev/null
    then
    curl -sS https://raw.githubusercontent.com/diogocavilha/fancy-git/master/install.sh | sh
    else
        echo "Fancygit already exists..."
    fi

    # Create links
    echo "Creating softlinks..."
    ln -sf ~/.dotfiles/.bashrc ~/.bashrc
    ln -sf ~/.dotfiles/nvim/ ~/.config/nvim
    ln -sf ~/.dotfiles/fancygit/app_config ~/.fancy-git/app_config

    echo "Complete"

fi
