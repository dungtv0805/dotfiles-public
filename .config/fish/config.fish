set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always
set -gx rfab "$HOME/code/approval/approval-be"
set -gx rfaf "$HOME/code/approval/approval-fe"

function nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end
nvm use default


# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
alias c claude
alias tn "tmux new-session -s"
alias ta "tmux attach-session -t"
alias tls "tmux list-sessions"
alias tks "tmux kill-session -t"
alias tka "tmux kill-session -a"
alias vi nvim
alias lg lazygit
alias dcu "docker-compose up -d"
alias dcd "docker-compose down"
alias dps "docker ps"
alias de "docker exec -it"
alias drm "docker rm -f"

command -qv nvim && alias vim nvim

set -gx PATH /opt/homebrew/bin /opt/homebrew/sbin /usr/local/bin /usr/bin /bin /usr/sbin /sbin $PATH

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
    case '*'
        source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

# fish config
if status is-interactive 
and not set -q TMUX
    # exec tmux
end
clear