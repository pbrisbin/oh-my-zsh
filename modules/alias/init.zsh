#
# Defines general aliases.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Load dependencies.
omodload 'spectrum'

setopt CORRECT # Correct commands.

# The 'ls' Family
if is-callable 'dircolors'; then
  # GNU core utilities.
  alias ls='ls --group-directories-first'

  if zstyle -t ':omz:alias:ls' color; then
    if [[ -f "$HOME/.dir_colors" ]]; then
      eval "$(dircolors "$HOME/.dir_colors")"
    else
      eval "$(dircolors)"
    fi
    alias ls="$aliases[ls] --color=auto"
  else
    alias ls="$aliases[ls] -F"
  fi
else
  # BSD core utilities.
  if zstyle -t ':omz:alias:ls' color; then
    export LSCOLORS="exfxcxdxbxegedabagacad"
    alias ls="ls -G"
  else
    alias ls='ls -F'
  fi
fi

alias l='ls -1A'         # List in one column.
alias ll='ls -lh'        # List human readable sizes.
alias lr='ll -R'         # List recursively.
alias la='ll -A'         # List hidden files.
alias lp='la | "$PAGER"' # List through pager.
alias lx='ll -XB'        # List sorted by extension.
alias lk='ll -Sr'        # List sorted by size, largest last.
alias lt='ll -tr'        # List sorted by date, most recent last.
alias lc='lt -c'         # List sorted by date, most recent last, show change time.
alias lu='lt -u'         # List sorted by date, most recent last, show access time.
alias sl='ls'            # I often screw this up.

# General
alias _='sudo'
alias b='${(z)BROWSER}'
alias cd='nocorrect cd'
alias cp='nocorrect cp'
alias df='df -kh'
alias du='du -kh'
alias e='${(z)EDITOR}'
alias find='noglob find'
alias fc='noglob fc'
alias gcc='nocorrect gcc'
alias history='noglob history'
alias ln='nocorrect ln'
alias locate='noglob locate'
alias man='nocorrect man'
alias mkdir='nocorrect mkdir -p'
alias mv='nocorrect mv'
alias p='${(z)PAGER}'
alias po='popd'
alias pu='pushd'
alias rake='noglob rake'
alias rm='nocorrect rm'
alias scp='nocorrect scp'
alias type='type -a'

# Mac OS X
if [[ "$OSTYPE" == darwin* ]]; then
  alias o='open'
  alias get='curl --continue-at - --location --progress-bar --remote-name'
else
  alias o='xdg-open'
  alias get='wget --continue --progress=bar'

  if (( $+commands[xclip] )); then
    alias pbcopy='xclip -selection clipboard -in'
    alias pbpaste='xclip -selection clipboard -out'
  fi

  if (( $+commands[xsel] )); then
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
  fi
fi

alias pbc='pbcopy'
alias pbp='pbpaste'

# Miscellaneous
if (( $+commands[ack] )) alias afind='nocorrect ack'
if (( $+commands[ebuild] )) alias ebuild='nocorrect ebuild'
if (( $+commands[gist] )) alias gist='nocorrect gist'
if (( $+commands[heroku] )) alias heroku='nocorrect heroku'
if (( $+commands[mysql] )) alias mysql='nocorrect mysql'

# Custom
alias myip='printf "%s\n" "$(curl --silent http://tnx.nl/ip)"'
alias path='echo -e "${PATH//:/\n}"'
alias apptree='tree -I "dist|config|static|pandoc|tmp"'

if (( $+commands[mpc] )); then
  alias n='mpc next'
  alias p='mpc prev'
  alias np="mpc --format '%title% - %artist%' current | head -n 1"

  (( $+commands[albumbler] )) && alias a='albumbler'
fi

if [[ -b '/dev/sr0' ]]; then
  alias eject='eject -T /dev/sr0'
  alias mountdvd='sudo mount -t iso9660 -o ro /dev/sr0 /media/dvd/'
fi

if (( $+commands[mplayer] )); then
  alias playiso='mplayer dvd://1 -dvd-device'
  alias playdvd='mplayer dvdnav:// /dev/sr0'
  alias playcda='mplayer cdda:// -cdrom-device /dev/sr0 -cache 10000'
fi

alias updatehtpc='curl "http://htpc:8080/xbmcCmds/xbmcHttp?command=ExecBuiltIn&parameter=XBMC.updatelibrary(video)"'
