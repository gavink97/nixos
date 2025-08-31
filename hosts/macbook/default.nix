{...}: {
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core
  ];

  programs.light.enable = true;

  hardware = {
    asahi = {
      enable = true;
      #extractPeripheralFirmware = false;
      peripheralFirmwareDirectory = /etc/nixos/firmware;
      #useExperimentalGPUDriver = true;
      #experimentalGPUInstallMode = "replace";
      setupAsahiSound = true;
    };
    bluetooth.enable = true;
  };
}
