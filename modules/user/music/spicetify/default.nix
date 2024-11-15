{ config, inputs, lib, pkgs, ... }:

{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  options.spicetify.enable = lib.mkEnableOption "enables spicetify";

  config = {
    programs.spicetify = lib.mkIf config.spicetify.enable {
      enable = true;

      # Custom spicetify plugins
      enabledExtensions = with inputs.spicetify-nix.legacyPackages.${pkgs.system}.extensions; [
        adblock
        hidePodcasts
        shuffle
      ];
    };
  };
}
