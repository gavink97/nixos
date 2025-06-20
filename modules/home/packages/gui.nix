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

    mate.caja
    mate.atril
    mate.mate-calc
    mate.eom
    mate.libmatekbd
    resources
    font-manager
  ];
}
