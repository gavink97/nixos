{
pkgs,
inputs,
username,
host,
...
}:
{
    imports = [ inputs.home-manager.nixosModules.home-manager ];

    home-manager = {
        useUserPackages = true;
        useGlobalPkgs = true;
        extraSpecialArgs = { inherit inputs username host; };
        users.${username} = {
            imports = [./../home];
            home.username = "${username}";
            home.homeDirectory = "/home/${username}";
            home.stateVersion = "25.05";
            programs.home-manager.enable = true;
        };
    };

users.users.${username} = {
    shell = pkgs.zsh;
    useDefaultShell = false;
    isNormalUser = true;
    extraGroups = [
        "wheel"
        "seat"
        "video"
        "input"
        "networkmanager"
    ];
};

nix.settings.allowed-users = [ "${username}" ];
    }
