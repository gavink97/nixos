{ pkgs, ... }:
{
    services.gnome = {
        gnome-keyring.enable = true;
    };

  # services.openssh.enable = true;
    virtualisation.docker.enable = true;
    systemd.services.plasma-polkit-agent.enable = true;
}
