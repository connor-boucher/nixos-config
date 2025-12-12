{ config, inputs, lib, pkgs, ... }:

{
  imports = [
    inputs.textfox.homeManagerModules.default
  ];

  options.browsers.firefox.enable = lib.mkEnableOption "enables firefox";

  config = lib.mkIf config.browsers.firefox.enable {
    stylix.targets.firefox.colorTheme.enable = true;
    stylix.targets.firefox.profileNames = [ "default" ];

    programs.firefox = {
      enable = true;
      policies = {
        AutofillAddressEnabled = false;
        AutofillCreditCardEnabled = false;
        DisableAccounts = true;
        DisableFormHistory = true;
        DisableTelemetry = true;
        HttpsOnlyMode = "enabled";
        OfferToSaveLoginsDefault = false;
        PasswordManagerEnabled = false;
      };
      profiles.default.extensions = {
        packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
          ctrl-number-to-switch-tabs
          lesspass
          proton-vpn
          tridactyl
          ublock-origin
        ];
        force = true;
      };
    };

      textfox = {
        enable = true;
        profile = "default";
        config = {
          displayNavButtons = true;
          newtabLogo = "";
        };
      };

      home.packages = [
        (pkgs.writeShellScriptBin "firefox" ''
          export HOME="~/.local/user"
          exec "${config.programs.firefox.package}/bin/firefox" "$@"
        '')
      ];
    };
  }
