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

    #css
    stylelint

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
    nixfmt

    #golang
    air
    go
    golangci-lint
    goimports-reviser
    templ
    prettier
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
