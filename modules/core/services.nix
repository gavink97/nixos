{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.hyprpolkitagent
  ];

  services = {
    gnome.gnome-keyring.enable = true;
    envfs.enable = true;

    logind.powerKey = "suspend";
  };

  # services.openssh.enable = true;
  virtualisation.docker.enable = true;
  # systemd.services.plasma-polkit-agent.enable = true;
}
