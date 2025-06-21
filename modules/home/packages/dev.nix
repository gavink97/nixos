{pkgs, ...}: {
  home.packages = with pkgs; [
    gcc
    gnumake
    devenv

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

    #ruby
    ruby

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
    goimports-reviser
    templ

    #rust
    rustc
    cargo

    #ziglang
    zig
  ];
}
