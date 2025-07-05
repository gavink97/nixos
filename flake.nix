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

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    username = "gavin";
    host = "nixos";
    system = "aarch64-linux";
    version = "25.05";

    inherit (nixpkgs) lib;
  in {
    nixosConfigurations.${host} = nixpkgs.lib.nixosSystem {
      # inherit system;
      specialArgs = {
        inherit
          self
          inputs
          username
          host
          system
          version
          ;
      };
      modules = [
        ./hosts/macbook
        inputs.apple-silicon-support.nixosModules.default
      ];
    };
  };
}
