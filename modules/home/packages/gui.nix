{ pkgs, ... }:
{
    home.packages = with pkgs; [
        feh
        pavucontrol
        wlogout
        waybar
        swaynotificationcenter
        rofi-wayland
    ];
}
