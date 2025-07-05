{
  pkgs,
  inputs,
  username,
  host,
  pkgs-nvim,
  system,
  version,
  ...
}: {
  imports = [inputs.home-manager.nixosModules.home-manager];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {inherit inputs username host pkgs-nvim system;};
    users.${username} = {
      imports = [./../home];
      home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        stateVersion = version;
      };
      programs.home-manager.enable = true;
    };
    backupFileExtension = "backup";
  };

  users.users.${username} = {
    shell = pkgs.zsh;
    useDefaultShell = false;
    isNormalUser = true;
    extraGroups = [
      "netdev"
      "wheel"
      "video"
      "input"
      "networkmanager"
      "docker"
    ];
  };

  nix.settings.allowed-users = ["${username}"];
}
