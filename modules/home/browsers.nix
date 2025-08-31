{
  pkgs,
  inputs,
  system,
  ...
}: {
  home.packages = with pkgs; [
    firefox
    chromium
    inputs.zen-browser.packages."${system}".default
    epiphany
    orca
  ];

  xdg.desktopEntries = {
    firefox = {
      name = "Firefox";
      exec = "firefox --ozone-platform=wayland --enable-features=UseOzonePlatform,WaylandWindowDecorations";
      icon = "firefox";
      type = "Application";
      comment = "Firefox web browser";
    };
  };
}
