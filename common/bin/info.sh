#!/bin/bash

# or use wm array -- add any that need to be recognized
wms=( 2bwm 2wm 9wm aewm afterstep ahwm alopex amiwm antiwm awesome blackbox bspwm catwm clfswm ctwm cwm dminiwm dragonflywm dwm echinus \
  euclid-wm evilpoison evilwm fluxbox flwm fvwm-crystal goomwwm hcwm herbstluftwm i3 icewm jwm karmen larswm lwm matwm2 mcwm monsterwm \
  musca notion nwm olwm openbox oroborus pekwm ratpoison sapphire sawfish sscrotwm sithwm smallwm snapwm spectrwm stumpwm subtle tfwm tinywm tritium twm \
  uwm vtwm w9wm weewm wind windowlab wm2 wmaker wmfs wmii wmx xfwm4 xmonad xoat yeahwm )

# define colors for color-echo
rst="\e[0m"

c00=$'\e[0;30m'
c01=$'\e[0;31m'
c02=$'\e[0;32m'
c03=$'\e[0;33m'
c04=$'\e[0;34m'
c05=$'\e[0;35m'
c06=$'\e[0;36m'
c07=$'\e[0;37m'
c08=$'\e[1;30m'
c09=$'\e[1;31m'
c10=$'\e[1;32m'
c11=$'\e[1;33m'
c12=$'\e[1;34m'
c13=$'\e[1;35m'
c14=$'\e[1;36m'
c15=$'\e[1;37m'


color-echo()
{  # print with colors
  echo -e "   $c04$b$1$\b$rst    ────────⟩    $c03$2$rst"
}

print-kernel()
{
#  color-echo 'KL' "$(uname -smr)"
color-echo 'krnl' "$(uname -r | sed s/-MANJARO//)"
}

print-uptime()
{
  up=$(</proc/uptime)
  up=${up//.*}                # string before first . is seconds
  days=$((${up}/86400))       # seconds divided by 86400 is days
  hours=$((${up}/3600%24))    # seconds divided by 3600 mod 24 is hours

  mins=$((${up}/60%60))       # seconds divided by 60 mod 60 is mins
  color-echo "uptm" $days'd '$hours'h '$mins'm'
}

print-shell() {
  color-echo 'shll' "$(echo $SHELL)"
}

print-cpu()
{
  arm=$(grep ARM /proc/cpuinfo)    # ARM procinfo uses different format
  if [[ "$arm" != "" ]]; then
    cpu=$(grep -m1 -i 'Processor' /proc/cpuinfo)
  else
    cpu=$(grep -m1 -i 'model name' /proc/cpuinfo)
  fi
  color-echo 'CPU' "${cpu#*: }" # everything after colon is processor name
}

print-gpu()
{
  gpu=$(lspci | grep VGA | awk -F ': ' '{print $2}' | sed 's/(rev ..)//g')
  color-echo 'GPU' "$gpu"
}

print-packages()
{
  packages=$(pacman -Q|wc -l)
  color-echo 'pkgs' "$packages"
}

print-wm()
{
  for wm in ${wms[@]}; do          # pgrep through wmname array
    pid=$(pgrep -x -u $USER $wm) # if found, this wmname has running process
    if [[ "$pid" ]]; then
      color-echo 'winm' $wm
      break
    fi
  done
}

print-distro()
{
  [[ -e /etc/os-release ]] && source /etc/os-release
  if [[ -n "$PRETTY_NAME" ]]; then
    color-echo 'OS' "$PRETTY_NAME"
  else
    color-echo 'OS' "not found"
  fi
}

print-host() {
	echo -e "       $c02$USER$rst @ $c02$USER"
}

print-term()
{
	color-echo 'term' "$(terminal-name)"
}

print-termfont()
{
  color-echo 'tefn' "$(cat $HOME/.Xresources | grep -v ! | awk '/URxvt.font/ {print $2 " " $3 " " $4}' | sed 's/xft://')"
}

print-sysfont()
{
  color-echo 'syfn' "$(sed -n 's/^[gtk].*font.*"\(.*\)".*$/\1/; s/ Medium 8//p' ~/.gtkrc-2.0)"
}
#echo
#echo -en "$ylw    ▄▄▄▄▄▄▄▄▄   $rst" && print-host
#echo -en "$ylw   ███▀▀▀▀▀███  $rst" && print-wm
#echo -en "$ylw   █  o   o  █  $rst" && print-kernel
#echo -en "$ylw   █▄▄▄▄▄▄▄▄▄█  $rst" && print-packages
#echo -en "$ylw   ███▄ x ▄███  $rst" && print-uptime
#echo -en "$ylw   ▀█████████▀  $rst" && print-term
#echo

echo
echo -en "$c01▉▉  | \n"
echo -en "$c09  ▉▉| $rst" && print-host
echo -en "$c02▉▉  | \n"
echo -en "$c10  ▉▉| \n"
echo -en "$c03▉▉  | $rst" && print-wm
echo -en "$c11  ▉▉| $rst" && print-shell
echo -en "$c04▉▉  | \n"
echo -en "$c12  ▉▉| $rst" && print-kernel
echo -en "$c05▉▉  | $rst" && print-packages
echo -en "$c13  ▉▉| $rst" && print-uptime
echo -en "$c06▉▉  | $rst" && print-term
echo -en "$c14  ▉▉| \n"
echo

#print-colors
