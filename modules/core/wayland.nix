{ inputs, pkgs, ... }:
{
    programs.hyprland = {
        enable = true;
    };

    xdg.portal = {
        enable = true;
        wlr.enable = true;
    };

  environment.systemPackages = with pkgs; [
     xdg-desktop-portal-hyprland
     xdg-desktop-portal-gtk
    ];
}
