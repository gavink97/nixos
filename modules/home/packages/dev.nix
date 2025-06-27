{pkgs, ...}: {
  home.packages = with pkgs; [
    gcc
    gnumake
    devenv

    #dev tools
    ansible
    playwright-driver.browsers
    pre-commit
    commitlint-rs
    tmux
    esbuild
    cacert

    docker
    docker-compose
    docker-buildx

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
