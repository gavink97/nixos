{pkgs, ...}: {
  services = {
    displayManager = {
      gdm.enable = true;
    };
    xserver = {
      enable = true;
      excludePackages = with pkgs; [
        xterm
      ];
      # setting from hyprland.conf
      #xkb = {
      #layout = "us, us";
      #variant = ",dvorak";
      #model = "apple";
      #options = "grp:caps_toggle";
      #};
    };
    printing.enable = false;
    libinput.enable = true;
  };
}
