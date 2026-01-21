{ inputs, pkgs, ... }:

{
  config = {
    stylix.targets.grub.enable = false;

    boot.loader = {
      grub = {
        enable = true;
        default = "saved";
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
        theme = inputs.nixos-grub-themes.packages.${pkgs.stdenv.hostPlatform.system}.nixos;
      };
      efi.canTouchEfiVariables = true;
    };
  };
}
