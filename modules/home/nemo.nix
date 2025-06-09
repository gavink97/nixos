{ pkgs, ... }:
{
    home.packages = with pkgs; [ nemo ];

    dconf.settings = {
        "org/nemo/preferences" = {
            show-hidden-files = true;
        };
    };
}
