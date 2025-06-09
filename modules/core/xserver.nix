{ pkgs, ... }:
{
  services.xserver = {
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

  services.printing.enable = false;
  services.libinput.enable = true;
}
