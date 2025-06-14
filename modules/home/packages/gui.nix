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
  ];
}
