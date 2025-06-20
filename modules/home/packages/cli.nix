{pkgs, ...}: {
  home.packages = with pkgs; [
    starship
    zoxide
    bat
    jq
    tmux
    ripgrep
    yq
    tree
    gh
    zsh
    fd
    eza
    direnv
    fzf
    sshfs
    yazi
    bc
    cron
    lsof
  ];
}
