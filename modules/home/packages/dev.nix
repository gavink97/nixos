{pkgs, ...}: {
  home.packages = with pkgs; [
    gcc

    #dev tools
    ansible
    pre-commit
    commitlint-rs

    docker
    docker-compose

    #lua
    lua

    #python
    python312

    #javascript
    nodejs_22
    biome

    #nix
    alejandra
    deadnix
    statix

    #golang
    air
    go
    golangci-lint
    templ

    #rust
    rustc
    cargo

    #ziglang
    zig
  ];
}
