#
# Much simpler pacman aliases.
#
# Authors:
#   Patrick Brisbin <pbrisbin@gmail.com>
#

# add sudo for everything (superfluous but convenient). use pacman-color
# if that's available.
if (( $+commands[pacman-color] )); then
  alias pacman='sudo pacman-color'
else
  alias pacman='sudo pacman'
fi

# remove packages that were installed at as dependencies for packages
# which are no longer installed.
alias pacorphans='pacman -Qqdt | pacman -R'
