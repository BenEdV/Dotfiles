#! /bin/bash

function setupWorkstation()
{
	# install homebrew and associated programs
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew tap Homebrew/bundle
	brew bundle --file="Brewfile-workstation"

	# install fzf
	/usr/local/opt/fzf/install

	# install tmux gitbar
	git clone https://github.com/aurelien-rainone/tmux-gitbar.git ~/.tmux-gitbar

	# symlink
	ln -sfv "$HOME/.dotfiles/editors/.vimrc" ~
	rm -r "$HOME/Library/Application Support/Sublime Text 3/Packages/User/"
	ln -sfv "$HOME/.dotfiles/editors/sublime/" "$HOME/Library/Application Support/Sublime Text 3/Packages/User"
	ln -sfv "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" "/usr/local/bin/subl"


	ln -sfv "$HOME/.dotfiles/git/.gitconfig" ~
	ln -sfv "$HOME/.dotfiles/git/.gitignore_global" ~
	ln -sfv "$HOME/.dotfiles/git/.hgignore_global" ~

	ln -sfv "$HOME/.dotfiles/system/.bash_profile" ~
	ln -sfv "$HOME/.dotfiles/system/.inputrc" ~
	ln -sfv "$HOME/.dotfiles/system/.git-completion.bash" ~

	ln -sfv "$HOME/.dotfiles/tmux/.tmux.conf" ~
	ln -sfv "$HOME/.dotfiles/tmux/.tmux-gitbar.conf" ~

	source .macos
}

function setupMacServer()
{
	# install homebrew and associated programs
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew tap Homebrew/bundle
	brew bundle --file="Brewfile-server"

	# install fzf
	/usr/local/opt/fzf/install

	# install tmux gitbar
	git clone https://github.com/aurelien-rainone/tmux-gitbar.git ~/.tmux-gitbar

	# symlink
	ln -sfv "$HOME/.dotfiles/editors/.vimrc" ~

	ln -sfv "$HOME/.dotfiles/git/.gitconfig" ~
	ln -sfv "$HOME/.dotfiles/git/.gitignore_global" ~
	ln -sfv "$HOME/.dotfiles/git/.hgignore_global" ~

	ln -sfv "$HOME/.dotfiles/system/.bash_profile" ~
	ln -sfv "$HOME/.dotfiles/system/.inputrc" ~
	ln -sfv "$HOME/.dotfiles/system/.git-completion.bash" ~

	ln -sfv "$HOME/.dotfiles/tmux/.tmux.conf" ~
	ln -sfv "$HOME/.dotfiles/tmux/.tmux-gitbar.conf" ~
}
