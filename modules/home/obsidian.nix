{ pkgs, ... }:
{
home.packages = with pkgs; [ obsidian ];
    # pkgs.writeShellScriptBin "obsidian-wayland" ''
    # obsidian --ozone-platform=wayland --enable-features=UseOzonePlatform,WaylandWindowDecorations
    # ''
}
