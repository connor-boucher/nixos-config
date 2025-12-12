{ config, inputs, lib, my, pkgs, ... }:

{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  options.music.spicetify.enable = lib.mkEnableOption "enables spicetify";

  config = lib.mkIf config.music.spicetify.enable {
    nixpkgs.config.allowUnfree = true;

    # Disable stylix default styling
    stylix.targets.spicetify.enable = false;

    programs.spicetify =
      let
        spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
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
