{ pkgs, ... }:
{
    home.packages = with pkgs; [
        cargo
        go
        nodejs_22
        python3
        ansible
        docker
        docker-compose
        gcc
    ];
}
