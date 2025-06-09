{ pkgs, host, ... }:
{
    networking = {
        hostName = "${host}";
        networkmanager.enable = true;
        nameservers = [
            "1.1.1.1" 
            "1.0.0.1"
        ];
        firewall = {
            enable = true;
        };
        wireless.iwd = {
            enable = true;
            settings.General.EnableNetworkConfiguration = true;
        };
    };

    environment.systemPackages = with pkgs; [
        mullvad-vpn
        networkmanagerapplet
    ];

    services.mullvad-vpn = {
        enable = true;
        package = pkgs.mullvad-vpn;
    };

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
}
