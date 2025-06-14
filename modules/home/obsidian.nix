{pkgs, ...}: {
  home.packages = with pkgs; [
    obsidian
    (writeShellScriptBin "obsidian-wayland" ''
      obsidian --ozone-platform=wayland --enable-features=UseOzonePlatform,WaylandWindowDecorations
    '')
  ];
}
