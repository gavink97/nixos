{pkgs, ...}: {
  services = {
    xserver = {
      enable = true;
      excludePackages = with pkgs; [
        xterm
      ];
      displayManager = {
        gdm.enable = true;
      };
      # setting from hyprland.conf
      xkb = {
        layout = "us, us";
        variant = ",dvorak";
        model = "apple";
        options = "grp:caps_toggle";
      };
    };
    printing.enable = false;
    libinput.enable = true;
  };
}
