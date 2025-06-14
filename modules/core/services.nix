{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.hyprpolkitagent
  ];

  services.gnome = {
    gnome-keyring.enable = true;
  };

  services.envfs.enable = true;

  # services.openssh.enable = true;
  virtualisation.docker.enable = true;
  # systemd.services.plasma-polkit-agent.enable = true;
}
