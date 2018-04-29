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
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#neofetch

# Alias
alias sob="source ~/.zshrc"
alias delete="rm -fr"

# Directory
alias downloads="cd ~/Downloads"
alias documents="cd ~/Documents"

# Misc
alias tarxvf="tar -xvf"

# >> NetworkManager
alias nmcli_wifi_on='nmcli r wifi on'
alias nmcli_wifi_off='nmcli r wifi off'
alias nmcli_devices_status='nmcli d'
alias nmcli_SSID_history='nmcli c'
alias nmcli_scan_all_wlo1='iwlist wlo1 scanning | less'
alias nmcli_list_SSID='nmcli dev wifi'

# >> Wifi_ESSID
alias nmcli_connect_wtm='nmcli dev wifi connect Orange-1D69 password WTMODELS2017'
alias nmcli_connect_muma='nmcli dev wifi connect MOVISTAR_5C00 password g4C5KqkYPh5cKl8Qyozn'
alias nmcli_connect_maison='nmcli dev wifi connect Livebox-CD55 password 283EC2A80979CE762AF667F885'
alias nmcli_connect_montbonnot='nmcli dev wifi connect FCbox password BARATIN2018'
alias nmcli_connect_slowcafe='nmccli dev wifi connect SOFFFA \ Guillotiere\ slowcafe'

# >> File extensions
for ext in html php com net no;				do alias -s $ext=$BROWSER; done
for ext in txt tex org py c cpp PKGBUILD;		do alias -s $ext=$EDITOR; done
for ext in png jpg gif;					do alias -s $ext=$PICVIEW; done
for ext in mpg wmv avi mp4 mkv;				do alias -s $ext=$MOVPLAY; done
