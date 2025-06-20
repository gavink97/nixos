{
  pkgs,
  inputs,
  system,
  ...
}: {
  home.packages = with pkgs; [
    firefox
    chromium
    epiphany
    inputs.zen-browser.packages."${system}".default
    orca
  ];
}
