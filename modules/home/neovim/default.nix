{
  config,
  pkgs,
  lib,
  ...
}: let
  fromGitHub = ref: repo:
    pkgs.vimUtils.buildVimPlugin {
      pname = "${lib.strings.sanitizeDerivationName repo}";
      version = ref;
      src = builtins.fetchGit {
        url = "https://github.com/${repo}.git";
        ref = ref;
      };
    };
in {
  programs.neovim = {
    enable = true;
    # package = pkgs.neovim-nightly;
    defaultEditor = true;
    withNodeJs = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      lazy-nvim
      telescope-nvim
      everforest
      cloak-nvim
      autoclose-nvim
      vim-tmux-navigator
      gitsigns-nvim
      trouble-nvim
      nvim-treesitter.withAllGrammars
      nvim-treesitter-textobjects
      nvim-ts-autotag

      lualine-nvim

      conform-nvim
      nvim-lint
      nvim-dap

      nvim-lspconfig
      nvim-cmp
      cmp-buffer
      cmp-path
      cmp-cmdline
      cmp_luasnip
      cmp-nvim-lsp
      luasnip
      friendly-snippets
      fidget-nvim
      #neogen
      vim-nix

      nvim-web-devicons
      undotree
      vim-fugitive

      #vim-be-good
      plenary-nvim
      #harpoon2

      remote-sshfs-nvim

      markdown-preview-nvim

      # handle build requirements
      (fromGitHub "main" "barrett-ruth/import-cost.nvim")
      # (fromGitHub "main" "tigion/nvim-asciidoc-preview")
    ];

    extraPackages = with pkgs; [
      gcc
      git

      wl-clipboard
      ripgrep
      fzf
      nodePackages.alex

      #bash
      shellcheck
      beautysh
      bash-language-server

      #css
      stylelint

      #docker
      dockerfile-language-server-nodejs
      docker-compose-language-service

      #glsl
      glsl_analyzer

      #html
      htmlhint

      #htmx
      htmx-lsp

      #javascript
      biome
      jsbeautifier
      typescript
      vscode-langservers-extracted
      typescript-language-server

      #python
      yapf
      python313Packages.flake8
      python313Packages.mypy
      python313Packages.python-lsp-server

      #golang
      goimports-reviser
      gopls
      gotools
      golangci-lint
      templ
      delve

      #lua
      stylua
      lua-language-server
      luajitPackages.luacheck

      #markdown
      marksman

      #rust
      rust-analyzer
      rustfmt

      #sql
      sqls

      #swift
      swift
      sourcekit-lsp

      #tailwindcss
      tailwindcss-language-server

      #nix
      nil
      alejandra
      deadnix
      statix

      #vim
      vim-language-server

      #yaml
      yaml-language-server
      yamlfmt

      #zig
      zig
      zigimports
      zls
      lldb
    ];

    extraLuaConfig = ''
      vim.g.mapleader = " "
      require("config.init")

      require("lazy").setup({
              defaults = {
                  lazy = false,
                  version = false,
              },
              performance = {
              	reset_packpath = false,
                  rpt = {
              	    reset = false,
                  },
              },
              dev = {
              	path = "${pkgs.vimUtils.packDir config.programs.neovim.finalPackage.passthru.packpathDirs}/pack/myNeovimPackages/start",
              	patterns = {""},
              },
              install = {
             	    missing = false,
              },
              spec = {
                   { import = "plugins" },
             },
         })
    '';
  };

  xdg = {
    configFile."nvim/lua" = {
      recursive = true;
      source = ./lua;
    };
    desktopEntries = {
      nvim = {
        name = "Neovim";
        type = "Application";
        noDisplay = true;
      };
    };
  };
}
