{
  pkgs,
  inputs,
  system,
  ...
}: {
  home.packages = with pkgs; [
    firefox
    chromium
    inputs.zen-browser.packages."${system}".default
    orca
  ];
}
