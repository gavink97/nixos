{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # hyprlock
    hypridle
  ];

  programs.hyprlock.enable = true;
}
