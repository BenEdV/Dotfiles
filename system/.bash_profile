#! bin/bash

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.dotfiles/system/.{path,prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Add tab completion for many Bash commands
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
	source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# autocomplete git
[ -f ~/.git-completion.bash ] && source ~/.git-completion.bash

# autocomplete ssh
_complete_ssh_hosts ()
{
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        comp_ssh_hosts=$(grep "^Host " ~/.ssh/config | awk '{print $2}')
        COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- "$cur"))
        return 0
}
complete -F _complete_ssh_hosts ssh scp

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# start in tmux
tmux attach -t default || tmux new-session -s default
