{pkgs, ...}: {
  home.packages = with pkgs; [
    gcc

    #dev tools
    ansible
    pre-commit
    commitlint-rs
    tmux
    esbuild
    cacert

    docker
    docker-compose

    #lua
    lua
    luaformatter

    #python
    python312

    #javascript
    nodejs_22
    biome

    #nix
    alejandra
    deadnix
    statix
    nix-prefetch-github

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
