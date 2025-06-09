{ pkgs, ... }:
{

    environment.systemPackages = with pkgs.gnomeExtensions; [
        battery-health-charging
    ];

    programs.dconf.profiles = {
        user.databases = [{
            settings =  {
                "org/gnome/shell".enabled-extensions = [
                    "battery-health-charging@maxiacx"
                ];
            };
        }];
    };
}
