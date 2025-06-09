{ pkgs, ... }:
{
    fonts.fontDir.enable = true;

    fonts.packages = with pkgs; [
        nerd-fonts.fira-mono
        nerd-fonts.droid-sans-mono
        liberation_ttf
    ];
}
