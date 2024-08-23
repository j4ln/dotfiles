# QT Theme
export QT_QPA_PLATFORMTHEME=qt5ct

# Fix Java applications under bspwm
export _JAVA_AWT_WM_NONREPARENTING=1

# Fcitx IMF
#export GTK_IM_MODULE=fcitx
#export QT_IM_MODULE=fcitx
#export XMODIFIERS=@im=fcitx

# SSH agent
eval $(ssh-agent)

exec bspwm
