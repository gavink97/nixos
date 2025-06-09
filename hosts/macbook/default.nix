{ pkgs, ... }: {

    imports = [
        ./hardware-configuration.nix
        ./../../modules/core
    ];

    environment.systemPackages = with pkgs; [ brillo ];

    hardware = {
        asahi = {
            enable = true;
            peripheralFirmwareDirectory = /etc/nixos/firmware;
            useExperimentalGPUDriver = true;
            experimentalGPUInstallMode = "replace";
            setupAsahiSound = true;
        };
        bluetooth.enable = true;
    };
}
