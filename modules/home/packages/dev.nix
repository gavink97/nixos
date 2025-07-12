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

    #asciidoc
    asciidoctor

    # docker
    docker
    docker-compose
    docker-buildx

    #lua
    lua
    stylua

    #ruby
    ruby

    #python
    python312

    #javascript
    nodejs_22
    biome

    #nix
    deadnix
    statix

    #golang
    air
    go
    golangci-lint
    goimports-reviser
    templ
    delve

    #rust
    rustc
    cargo

    #swift
    swift

    #ziglang
    zig
    lldb
  ];
}
