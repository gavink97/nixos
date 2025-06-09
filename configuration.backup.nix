{ config, lib, pkgs, ... }:

{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
        # ./apple-silicon-support
    <apple-silicon-support/apple-silicon-support>
      # <home-manager/nixos>
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;
  fonts.fontDir.enable = true;

  nixpkgs.config.allowUnfree = true;
  networking.hostName = "nixos";

  nix.settings.experimental-features = [ "nix-command" "flakes"];

  networking.wireless.iwd = {
    enable = true;
    settings.General.EnableNetworkConfiguration = true;
  };

  time.timeZone = "Australia/Sydney";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  #};

services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --time-format '%I:%M %p | %a • %h | %F' --cmd Hyprland";
        user = "greeter";
      };
     };
   };

  services.xserver = {
	  enable = true;
	  excludePackages = with pkgs; [
		xterm
		];
	  xkb = {
		  layout = "us";
		  variant = "";
	  };
	  displayManager = {
		gdm.enable = true;
	};
  };

  services.printing.enable = false;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput.enable = true;

  services.mullvad-vpn = {
        enable = true;
        package = pkgs.mullvad-vpn;
    };

  services.gnome.gnome-keyring.enable = true;

  users.users.gavin = {
    shell = pkgs.zsh;
    useDefaultShell = false;
    isNormalUser = true;
    extraGroups = [ "wheel" "seat" "video" "input" ];
  };

  environment.systemPackages = with pkgs; [
     vim
     neovim
     tmux
     wget
     tree
     alacritty
     gh
     git
     zsh
     starship
     bat
     zoxide
     dunst
     xdg-desktop-portal-hyprland
     xdg-desktop-portal-gtk
     seatd
     qt6ct
     nemo
     waybar
     hyprpaper
     networkmanagerapplet
     hyprcursor
     fastfetch
     fzf
     feh
     gcc
     ripgrep
     jq
     fd
     go
     docker
     fuzzel
     nodejs_22
     python3
     ansible
     docker-compose
     hypridle
     hyprlock
     hyprpicker
     pavucontrol
     wlogout
     brillo
     greetd.tuigreet
     firefox
     keepassxc
     obsidian
     webcord
     thunderbird
    mullvad-vpn
    ente-auth
     eza
    direnv
    yq
    sshfs
     (import ./obsidian.nix {inherit pkgs; })
   ] ++ (with pkgs.gnomeExtensions; [
	  battery-health-charging
   ]);

  services.seatd.enable = true;
  systemd.services.plasma-polkit-agent.enable = true;
  programs = {
	  zsh = {
        enable = true;
};
	  hyprland = {
		  enable = true;
	  };
	  dconf.enable = true;
  };

  xdg.portal = {
	  enable = true;
	  wlr.enable = true;
  };

fonts.packages = with pkgs; [
  nerd-fonts.fira-mono
  nerd-fonts.droid-sans-mono
];

virtualisation.docker.enable = true;

# Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?

	  hardware = {
		  asahi = {
			  enable = true;
			  peripheralFirmwareDirectory = /etc/nixos/firmware;
			  useExperimentalGPUDriver = true;
			  experimentalGPUInstallMode = "replace";
			  setupAsahiSound = true;
		  };
        bluetooth.enable = true;
	  };

  programs.dconf.profiles = {
	  user.databases = [{
		  settings =  {
			  "org/gnome/shell".enabled-extensions = [
				  "battery-health-charging@maxiacx"
			  ];
		  };
	  }];
  };
}

