{ ... }:
{
  imports = [
    ./battery.nix
    ./bootloader.nix
    ./xserver.nix
    ./network.nix
    ./nh.nix
    ./audio.nix
    ./security.nix
    ./services.nix
    ./system.nix
    ./users.nix
    ./wayland.nix
    ./greet.nix
    ./programs.nix
    ./fonts.nix
  ];
}
