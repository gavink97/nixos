{ pkgs, ... }:
{
    home.packages = with pkgs; [
        hypridle
        hyprpicker
        hyprpaper
        hyprcursor
    ];
}
