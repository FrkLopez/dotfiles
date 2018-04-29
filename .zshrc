# Created by newuser for 5.4.2
ZSH=/home/frank/oh-my-zsh

ZSH_THEME="bira"
#POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
CASE_SENSITIVE="true"

DISABLE_AUTO_TITLE="true"

# Set terminal title bar
printf "\033];%s\07" "URxvt"

plugins=(
    git
    archlinux
    themes
    color-command
    colored-man-pages
    zsh-completions
)

source /home/frank/oh-my-zsh/oh-my-zsh.sh
source $HOME/.zprofile
source $HOME/.zshenv
source $HOME/.zaliases
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#neofetch

# >> File extensions
for ext in html php com net no;				do alias -s $ext=$BROWSER; done
for ext in txt tex org py c cpp PKGBUILD;		do alias -s $ext=$EDITOR; done
for ext in png jpg gif;					do alias -s $ext=$PICVIEW; done
for ext in mpg wmv avi mp4 mkv;				do alias -s $ext=$MOVPLAY; done
