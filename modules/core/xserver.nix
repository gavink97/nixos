{pkgs, ...}: {
  services = {
    xserver = {
      enable = true;
      excludePackages = with pkgs; [
        xterm
      ];
      xkb = {
        layout = "us";
        variant = "";
      };
      displayManager = {
        gdm.enable = true;
      };
    };
    printing.enable = false;
    libinput.enable = true;
  };
}
