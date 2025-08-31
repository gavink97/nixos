{
  pkgs,
  version,
  ...
}: {
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
      sandbox = true;
    };
  };

  environment.systemPackages = with pkgs; [
    wget
    git
    playerctl
    wev
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  time.timeZone = "Asia/Jakarta";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        addons = with pkgs; [
          fcitx5-hangul
        ];
        settings = {
          globalOptions = {
            "Hotkey/TriggerKeys" = {
              "1" = "Zenkaku_Hankaku";
              "2" = "Hangul";
            };
            "Hotkey/AltTriggerKeys" = {
              "0" = "Shift_L";
            };
            "Hotkey/ActivateKeys" = {
              "0" = "Hangul_Hanja";
            };
            "Hotkey/DeactivateKeys" = {
              "0" = "Hangul_Romaja";
            };
            "Hotkey/PrevPage" = {
              "0" = "Up";
            };
            "Hotkey/NextPage" = {
              "0" = "Down";
            };
            "Hotkey/PrevCandidate" = {
              "0" = "Shift+Tab";
            };
            "Hotkey/NextCandidate" = {
              "0" = "Tab";
            };
            "Hotkey/TogglePreedit" = {
              "0" = "Control+Alt+P";
            };
            "Behavior" = {
              "ActivateByDefault" = "True";
            };
          };
          inputMethod = {
            GroupOrder."0" = "Default";
            "Groups/0" = {
              Name = "Default";
              "Default Layout" = "us";
              DefaultIM = "keyboard-kr";
            };
            "Groups/0/Items/0".Name = "keyboard-us";
            "Groups/0/Items/1".Name = "keyboard-kr";
            "Groups/0/Items/2".Name = "keyboard-us-dvorak";
          };
        };
        waylandFrontend = true;
      };
    };
  };
  system.stateVersion = version;
  # system.copySystemConfiguration = true;
}
