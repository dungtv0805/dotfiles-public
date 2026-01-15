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
set -gx cyt "$HOME/code/cyt"
set -gx cytf "$HOME/code/cyt-fe"
set -gx dcs "$HOME/code/docker_chimseo"
set -gx dotfile "$HOME/code/dotfiles-public"

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
alias dps "docker ps -a"
alias de "docker exec -it"
alias drm "docker rm -f"
alias dr "docker restart"
alias drma "docker rm -f (docker ps -aq)"
alias dlf "docker logs -f"

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

# ❯ echo 'export PATH="/opt/homebrew/opt/dotnet@8/bin:$PATH"' >> ~/.zshrc
set -gx PATH /opt/homebrew/opt/dotnet@8/bin $PATH
set -gx PATH /opt/homebrew/opt/dotnet@6/bin $PATH
set -Ux JAVA_HOME (/opt/homebrew/bin/brew --prefix openjdk)
set -Ux PATH $JAVA_HOME/bin $PATH
set -Ux XDG_CONFIG_HOME $HOME/.config


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

# Load all aliases from aliases folder
set ALIASES_DIR (dirname (status --current-filename))/aliases
if test -d $ALIASES_DIR
    for file in $ALIASES_DIR/*.fish
        source $file
    end
end

# fish config
if status is-interactive
    and not set -q TMUX
    # exec tmux
end
clear
