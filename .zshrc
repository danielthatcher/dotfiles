# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _correct
zstyle ':completion:*' insert-unambiguous false
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select=long
zstyle ':completion:*' original true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/daniel/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob
unsetopt beep notify
# End of lines configured by zsh-newuser-install

autoload -U colors
colors
PROMPT="%{$fg[cyan]%}%n%{$fg[white]%}:%{$fg[yellow]%}%~ %(!.#.$)%{$reset_color%} "

#Add ~/.local/bin to path
export PATH="$HOME/.local/bin:$PATH"

#User aliases
##Pakcage management
alias pac='sudo pacman -S'
alias pacs='pacman -Ss'
alias pacr='sudo pacman -Rs'
alias pacu='sudo pacman -Syu && pacaur -Syyu'

##Power
alias bork='systemctl poweroff'
alias hibernate='~/.i3/lock.sh && systemctl hibernate'

##File associations
function openVideo() {
    ext=$(echo $1 | cut -f 1 -d '.')
	vlc "$@" 2>/dev/null &
}
alias -s {ts,mkv,mp3,mp4,srt,avi}="openVideo"
alias -s {jpg,jpeg,png,tiff,pdf}="chromium"
alias -s {zip}="unzip"
alias mlink='torify peerflix -v'
alias tmlink='sudo -u tor tor & torify peerflix -v'
alias -s {jar}='java -jar'

##Misc
alias lsa='ls -A'
alias jbook='cd ~/Projects/ && jupyter-notebook'
alias syncgdrive='cd /home/daniel/GoogleDrive/ && grive && cd -'
