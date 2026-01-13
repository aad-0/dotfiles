
. ~/.bashrc
# USER
# TODO Maybe Add aarch toolchain ??
#
#
# ~/.bash_aliases or ~/.bashrc
# alias start-ssh-agent='
#   export SSH_AUTH_SOCK="$HOME/.ssh/ssh-agent.sock"
#   eval $(ssh-agent -a $SSH_AUTH_SOCK)
#   find $HOME/.ssh -maxdepth 1 -type f -name "id_*" ! -name "*.pub" -exec ssh-add {} \;
# '

alias start-ssh-agent='
  eval $(ssh-agent -s)
  find $HOME/.ssh -maxdepth 1 -type f -name "id_*" ! -name "*.pub" -exec ssh-add {} \;
'
alias stop-ssh-agent='
  pkill -9 ssh-agent
'

# alias stop-ssh-agent='
#   if [ -S "$HOME/.ssh/ssh-agent.sock" ]; then
#     SSH_AUTH_SOCK="$HOME/.ssh/ssh-agent.sock" ssh-agent -k
#   fi
# '

alias tmux="tmux -2"
alias tmux-ssh="TERM=screen-256color-bce tmux"
alias tmux-reset="tmux list-sessions | grep -v attached | awk 'BEGIN{FS=":"}{print $1}' | xargs -n 1 tmux kill-session -t || echo No sessions to kill"



# alias
# alias ls="ls -"
alias sl="ls -lah"
alias ping-all='ip -4 a | awk '"'"'/inet/ && !/127.0.0.1/ {split($2,a,"/"); split(a[1],b,"."); for(i=1;i<255;i++) print b[1]"."b[2]"."b[3]"."i}'"'"' | xargs -P20 -I{} bash -c '"'"'ping -c1 -W1 {} >/dev/null && echo {}'"'"''

alias pactl-list-sinks="pactl list short sinks"
alias pactl-set-sink="pactl set-default-sink"

alias xrandr-fix="feh --bg-fill  ~/Pictures/Wallpapers/wallhaven-vqojj8.jpg"
alias xrandr-edp-fix="xrandr --output eDP-1  --primary --preferred --rate 60 --mode 1920x1080 && xrandr-fix"
alias xrandr-hdmi-fix-right="xrandr --output HDMI-1-0 --right-of eDP-1 --primary --preferred --rate 60 --mode 1920x1080 && xrandr-fix"
alias xrandr-hdmi-fix-left="xrandr --output HDMI-1-0 --left-of eDP-1 --primary --preferred --rate 60 --mode 1920x1080 && xrandr-fix"

alias socat-vcom="socat -d -d pty,raw,echo=0 pty,raw,echo=0"
#

# path and shit
# export TMUX_TMPDIR=~/
#

# dotnet bin
export PATH="/home/aad/.dotfiles/bin:$PATH"


export STM32_PRG_PATH=/home/aad/STMicroelectronics/STM32Cube/STM32CubeProgrammer/bin
. "$HOME/.cargo/env"
export PATH="/home/aad/.local/bin:$PATH"
export PATH="/home/aad/ninja:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export GZ_SIM_SYSTEM_PLUGIN_PATH=$HOME/ardupilot_gazebo/build:${GZ_SIM_SYSTEM_PLUGIN_PATH}
export GZ_SIM_RESOURCE_PATH=$HOME/ardupilot_gazebo/models:$HOME/ardupilot_gazebo/worlds:${GZ_SIM_RESOURCE_PATH}





echo '
bind-key -n "M-R" respawn-pane -k
bind-key -n "M-G" set-option -g status
bind-key -n "M-N" select-pane -t :.-
bind-key -n "M-P" select-pane -t :.+
bind-key -n "M-X" kill-pane
bind-key -n "M-V" split-window -h -c "#{pane_current_path}"
bind-key -n "M-C" split-window -v -c "#{pane_current_path}"
bind-key -n "M-B" new-window -c ~/
bind-key -n "M-M" choose-tree -wZ
bind-key -n "M-Y" copy-mode
bind-key -n "M-O" resize-pane -Z
bind-key -n "M-J" resize-pane -D
bind-key -n "M-H" resize-pane -L
bind-key -n "M-K" resize-pane -U
bind-key -n "M-L" resize-pane -R
bind-key -n "M-:" command-prompt
'
# source /home/aad/.local/share/bob/env/env.sh
source /home/aad/alacritty/extra/completions/alacritty.bash
