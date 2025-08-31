{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.fira-mono
      julia-mono
      liberation_ttf
      baekmuk-ttf
      noto-fonts-emoji
      inter
      plus-jakarta-sans
      (pkgs.callPackage ../../custom/bodoni-moda.nix {})
      (pkgs.callPackage ../../custom/cooper.nix {})
      (pkgs.callPackage ../../custom/besley.nix {})
      (pkgs.callPackage ../../custom/drafting.nix {})
    ];

    fontconfig = {
      enable = true;
      antialias = true;
      subpixel = {
        rgba = "rgb";
        lcdfilter = "none";
      };
      hinting = {
        enable = true;
        style = "full";
        autohint = true;
      };
      defaultFonts = {
        emoji = [
          "Noto Color Emoji"
        ];
        serif = [
          "Bodoni Moda"
          "Liberation Serif"
        ];
        sansSerif = [
          "Inter Display"
          "Liberation Sans"
        ];
        monospace = [
          "Liberation Mono"
        ];
      };
    };

    fontDir.enable = true;
  };
}
