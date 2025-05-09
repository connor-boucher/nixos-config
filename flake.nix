{
  description = "NixOS Dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # home-manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # hyprland
    hyprland.url = "github:hyprwm/Hyprland";

    # nix-ld
    nix-ld.url = "github:Mic92/nix-ld";
    nix-ld.inputs.nixpkgs.follows = "nixpkgs";

    # nvf
    nvf.url = "github:notashelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";

    # spicetify-nix
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";

    # stylix
    stylix.url = "github:danth/stylix";
  };

  outputs = inputs @ { nixpkgs, home-manager, nix-ld, nvf, spicetify-nix, stylix, ... }: {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/desktop
          home-manager.nixosModules.default
          nix-ld.nixosModules.nix-ld
          nvf.nixosModules.nvf
          spicetify-nix.nixosModules.default
          stylix.nixosModules.stylix
        ];
      };
      laptop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/laptop
          home-manager.nixosModules.default
          nix-ld.nixosModules.nix-ld
          nvf.nixosModules.nvf
          spicetify-nix.nixosModules.default
          stylix.nixosModules.stylix
        ];
      };
    };
  };
}
