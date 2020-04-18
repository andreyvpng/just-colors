#!/usr/bin/env bash

if [ "$TERM" = "linux" ]; then
  echo -en "\e]P0{color0.strip}" #black
  echo -en "\e]P1{color1.strip}" #darkred
  echo -en "\e]P2{color2.strip}" #darkgreen
  echo -en "\e]P3{color3.strip}" #brown
  echo -en "\e]P4{color4.strip}" #darkblue
  echo -en "\e]P5{color5.strip}" #darkmagenta
  echo -en "\e]P6{color6.strip}" #darkcyan
  echo -en "\e]P7{color7.strip}" #lightgrey
  echo -en "\e]P8{color8.strip}" #darkgrey
  echo -en "\e]P9{color9.strip}" #red
  echo -en "\e]PA{color10.strip}" #green
  echo -en "\e]PB{color11.strip}" #yellow
  echo -en "\e]PC{color12.strip}" #blue
  echo -en "\e]PD{color13.strip}" #magenta
  echo -en "\e]PE{color14.strip}" #cyan
  echo -en "\e]PF{color15.strip}" #white
fi
