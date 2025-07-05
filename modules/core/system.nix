{
  pkgs,
  version,
  ...
}: {
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
      sandbox = true;
    };
  };

  environment.systemPackages = with pkgs; [
    wget
    git
    playerctl
    wev
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  time.timeZone = "Australia/Sydney";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      enable = true;
      type = "kime";
      kime.iconColor = "White";
    };
  };
  system.stateVersion = version;
  # system.copySystemConfiguration = true;
}
