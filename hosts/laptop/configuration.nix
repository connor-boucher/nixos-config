{ inputs, pkgs, ... }:

{
  imports = [
    ../../modules/system/themes
  ];

  programs.nix-ld.dev.enable = true;
  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  gruvbox.enable = true;
  security.polkit.enable = true;

  # Bootloader options
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "laptop";
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    xkb.layout = "us";
    xkb.options = "caps:swapescape";
    autoRepeatDelay = 300;
    autoRepeatInterval = 50;
  };
  console.useXkbConfig = true;

  services.libinput.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;
  programs.river.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  programs.zsh.enable = true;
  users.users.connor = {
    isNormalUser = true;
    description = "Connor";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.connor = import ./home.nix;
  };

  fonts.packages = [ pkgs.nerd-fonts.jetbrains-mono pkgs.jetbrains-mono ];

  system.stateVersion = "24.05";
}
