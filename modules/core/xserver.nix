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
    };
    printing.enable = false;
    libinput.enable = true;
  };
}
