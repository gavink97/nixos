{pkgs, ...}: {
  home.packages = with pkgs; [
    feh
    eww
    pavucontrol
    wlogout
    waybar
    swaynotificationcenter
    libnotify
    rofi-wayland
    blueberry
    btop
    grimblast
    wf-recorder
    adwaita-icon-theme
    morewaita-icon-theme
    obs-studio
  ];

  xdg.desktopEntries = {
    blueberry = {
      name = "Bluetooth";
      exec = "blueberry";
      icon = "bluetooth-symbolic";
      type = "Application";
      comment = "Custom definition for Blueberry";
    };

    rofi = {
      name = "Rofi";
      type = "Application";
      noDisplay = true;
    };

    rofi-theme-selector = {
      name = "Rofi Theme Selector";
      type = "Application";
      noDisplay = true;
    };

    webcord = {
      name = "Discord";
      exec = "webcord --enable-features=UseOzonePlatform --ozone-platform=wayland";
      icon = "discord";
      type = "Application";
      comment = "Custom definition for Discord";
    };
  };
}
