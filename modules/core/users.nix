{
  pkgs,
  inputs,
  username,
  host,
  pkgs-nvim,
  ...
}: {
  imports = [inputs.home-manager.nixosModules.home-manager];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {inherit inputs username host pkgs-nvim;};
    users.${username} = {
      imports = [./../home];
      home = {
        username = "${username}";
        homeDirectory = "/home/${username}";
        stateVersion = "25.05";
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
    ];
  };

  nix.settings.allowed-users = ["${username}"];
}
