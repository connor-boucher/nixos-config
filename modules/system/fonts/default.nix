{ pkgs, ... }:

{
  config.fonts.packages = [
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.jetbrains-mono
  ];
}
