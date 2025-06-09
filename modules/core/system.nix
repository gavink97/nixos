{ pkgs, inputs, ... }:
{
    
    nix = {
        settings = {
            auto-optimise-store = true;
            experimental-features = [ "nix-command" "flakes"];
            sandbox = true;
        };
    };

    environment.systemPackages = with pkgs; [
        wget
        git
    ];

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "Australia/Sydney";
  i18n.defaultLocale = "en_US.UTF-8";
  system.stateVersion = "25.05";
  # system.copySystemConfiguration = true;
}
