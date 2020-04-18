#!/bin/sh

# based base16-shell (https://github.com/chriskempson/base16-shell)

color00="{color0.red}/{color0.green}/{color0.blue}"
color01="{color1.red}/{color1.green}/{color1.blue}"
color02="{color2.red}/{color2.green}/{color2.blue}"
color03="{color3.red}/{color3.green}/{color3.blue}"
color04="{color4.red}/{color4.green}/{color4.blue}"
color05="{color5.red}/{color5.green}/{color5.blue}"
color06="{color6.red}/{color6.green}/{color6.blue}"
color07="{color7.red}/{color7.green}/{color7.blue}"
color08="{color8.red}/{color8.green}/{color8.blue}"
color09="{color9.red}/{color9.green}/{color9.blue}"
color10="{color10.red}/{color10.green}/{color10.blue}"
color11="{color11.red}/{color11.green}/{color11.blue}"
color12="{color12.red}/{color12.green}/{color12.blue}"
color13="{color13.red}/{color13.green}/{color13.blue}"
color14="{color14.red}/{color14.green}/{color14.blue}"
color15="{color15.red}/{color15.green}/{color15.blue}"
color_foreground="{foreground.red}/{foreground.green}/{foreground.blue}"
color_background="{background.red}/{background.green}/{background.blue}"

if [ -n "$TMUX" ]; then
  # Tell tmux to pass the escape sequences through
  # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
  put_template() { printf '\033Ptmux;\033\033]4;%d;rgb:%s\033\033\\\033\\' $@; }
  put_template_var() { printf '\033Ptmux;\033\033]%d;rgb:%s\033\033\\\033\\' $@; }
  put_template_custom() { printf '\033Ptmux;\033\033]%s%s\033\033\\\033\\' $@; }
elif [ "${TERM%%[-.]*}" = "screen" ]; then
  # GNU screen (screen, screen-256color, screen-256color-bce)
  put_template() { printf '\033P\033]4;%d;rgb:%s\007\033\\' $@; }
  put_template_var() { printf '\033P\033]%d;rgb:%s\007\033\\' $@; }
  put_template_custom() { printf '\033P\033]%s%s\007\033\\' $@; }
elif [ "${TERM%%-*}" = "linux" ]; then
  put_template() { [ $1 -lt 16 ] && printf "\e]P%x%s" $1 $(echo $2 | sed 's/\///g'); }
  put_template_var() { true; }
  put_template_custom() { true; }
else
  put_template() { printf '\033]4;%d;rgb:%s\033\\' $@; }
  put_template_var() { printf '\033]%d;rgb:%s\033\\' $@; }
  put_template_custom() { printf '\033]%s%s\033\\' $@; }
fi

# 16 color space
put_template 0  $color00
put_template 1  $color01
put_template 2  $color02
put_template 3  $color03
put_template 4  $color04
put_template 5  $color05
put_template 6  $color06
put_template 7  $color07
put_template 8  $color08
put_template 9  $color09
put_template 10 $color10
put_template 11 $color11
put_template 12 $color12
put_template 13 $color13
put_template 14 $color14
put_template 15 $color15

# 256 color space
put_template 16 $color16
put_template 17 $color17
put_template 18 $color18
put_template 19 $color19
put_template 20 $color20
put_template 21 $color21

# foreground / background / cursor color
if [ -n "$ITERM_SESSION_ID" ]; then
  # iTerm2 proprietary escape codes
  put_template_custom Pg {foreground.strip} # foreground
  put_template_custom Ph {background.strip} # background
  put_template_custom Pi {foreground.strip} # bold color
  put_template_custom Pj {color05.strip} # selection color
  put_template_custom Pk {foreground.strip} # selected text color
  put_template_custom Pl {cursor.strip} # cursor
  put_template_custom Pm {backgroud.strip} # cursor text
else
  put_template_var 10 $color_foreground
  if [ "$BASE16_SHELL_SET_BACKGROUND" != false ]; then
    put_template_var 11 $color_background
    put_template_var 708 $color_background # internal border (rxvt)
  fi
  put_template_custom 12 ";7" # cursor (reverse video)
fi

# clean up
unset -f put_template
unset -f put_template_var
unset -f put_template_custom
unset color00
unset color01
unset color02
unset color03
unset color04
unset color05
unset color06
unset color07
unset color08
unset color09
unset color10
unset color11
unset color12
unset color13
unset color14
unset color15
unset color16
unset color17
unset color18
unset color19
unset color20
unset color21
unset color_foreground
unset color_background
