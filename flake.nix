{
  description = "NixOS Dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # firefox-addons
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # hyprland
    hyprland.url = "github:hyprwm/Hyprland";

    # niri
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nix-ld
    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nixcord
    nixcord.url = "github:kaylorben/nixcord";

    # nixos-grub-themes
    nixos-grub-themes.url = "github:jeslie0/nixos-grub-themes";

    # noctalia
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nvf
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # spicetify-nix
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # stylix
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # textfox
    textfox.url = "github:adriankarlen/textfox";
  };

  outputs = inputs: {
    nixosConfigurations =
      let
        commonModules = with inputs; [
          home-manager.nixosModules.default
          nix-ld.nixosModules.nix-ld
          nvf.nixosModules.nvf
          spicetify-nix.nixosModules.default
          stylix.nixosModules.stylix
        ];

        mkHost = name: configPath: inputs.nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [ configPath ] ++ commonModules;
        };
      in
      {
        desktop = mkHost "desktop" ./hosts/desktop/configuration.nix;
        laptop = mkHost "laptop" ./hosts/laptop/configuration.nix;
      };
  };
}
