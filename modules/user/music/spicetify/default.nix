{ config, inputs, lib, pkgs, ... }:

{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  options.spicetify.enable = lib.mkEnableOption "enables spicetify";

  config = lib.mkIf config.spicetify.enable {
    nixpkgs.config.allowUnfree = true;

    programs.spicetify = {
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
