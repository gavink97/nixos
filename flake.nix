{
  description = "nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
        url = "github:nix-community/home-manager/release-25.05";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    apple-silicon-support = {
        url = "github:nix-community/nixos-apple-silicon";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ...}@inputs:
    let
        username = "gavin";
        host = "nixos";
        system = "aarch64-linux";
        pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in
    {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit self inputs username host; };
        modules = [
            ./hosts/macbook
            inputs.apple-silicon-support.nixosModules.default
    ];
};
};
}
