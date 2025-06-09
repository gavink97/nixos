{ pkgs, ... }:
{
    programs.zsh.enable = true;
    programs.dconf.enable = true;
    programs.gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
    };

  # programs.mtr.enable = true;
}
