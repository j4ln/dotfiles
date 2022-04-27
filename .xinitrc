export QT_QPA_PLATFORMTHEME=qt5ct
export WINIT_X11_SCALE_FACTOR=1	alacritty

# Fcitx IMF
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# SSH agent
eval $(ssh-agent)

exec bspwm
