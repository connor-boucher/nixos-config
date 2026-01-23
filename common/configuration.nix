{ config, home, inputs, myConfig, pkgs, ... }:

{
  imports = [
    myConfig
    ../modules/system/audio
    ../modules/system/boot
    ../modules/system/connectivity
    ../modules/system/desktop-manager
    ../modules/system/display
    ../modules/system/fonts
    ../modules/system/graphics
    ../modules/system/input
    ../modules/system/locale
    ../modules/system/networking
    ../modules/system/power
    ../modules/system/security
    ../modules/system/storage
    ../modules/system/themes
    ../modules/system/user
  ];

  # Enable home manager
  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
      my = config.my;
    };
    users.${config.my.user.username} = import home;
  };

  # Enable flakes and non-free packages
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable gc and optimization
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # Run unpatched dynamic binaries on NixOS
  programs.nix-ld.dev.enable = true;

  # Enable necessary programs
  programs.niri.enable = true;
  programs.river-classic.enable = true;
  programs.zsh.enable = true;

  # Enables the emacs daemon
  services.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
  };

  system.stateVersion = "25.05";
}
