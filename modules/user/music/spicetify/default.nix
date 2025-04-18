{ config, inputs, lib, my, pkgs, ... }:

{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  options.spicetify.enable = lib.mkEnableOption "enables spicetify";

  config = lib.mkIf config.spicetify.enable {
    nixpkgs.config.allowUnfree = true;

    # Disable stylix default styling
    stylix.targets.spicetify.enable = false;

    programs.spicetify =
      let
        spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
      in
      {
        enable = true;

        # Custom spicetify plugins
        enabledExtensions = with spicePkgs.extensions; [
          adblock
          hidePodcasts
          shuffle
        ];

        theme = my.theme.spicetify.theme;
        colorScheme = my.theme.spicetify.colorScheme;
      };
  };
}
