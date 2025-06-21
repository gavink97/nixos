{pkgs, ...}: {
  home.packages = with pkgs; [
    feh
    ghostty
    eww
    pavucontrol
    wlogout
    waybar
    swaynotificationcenter
    rofi-wayland
    blueberry
    btop
    grimblast
    wf-recorder
    obs-studio
  ];
}
