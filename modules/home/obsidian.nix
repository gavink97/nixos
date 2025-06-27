{pkgs, ...}: {
  home.packages = with pkgs; [
    obsidian
  ];

  xdg.desktopEntries = {
    obsidian = {
      name = "Obsidian";
      exec = "obsidian --ozone-platform=wayland --enable-features=UseOzonePlatform,WaylandWindowDecorations";
      icon = "obsidian";
      type = "Application";
      comment = "Custom definition for Obsidian";
    };
  };
}
