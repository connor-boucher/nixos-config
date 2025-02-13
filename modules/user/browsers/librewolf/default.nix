{ config, lib, pkgs, ... }:

{
  options.librewolf.enable = lib.mkEnableOption "enables librewolf";

  config = lib.mkIf config.librewolf.enable {
    programs.firefox = {
      enable = true;
      package = pkgs.librewolf;
      policies = {
        AutofillAddressEnabled = false;
        AutofillCreditCardEnabled = false;
        DisableAccounts = true;
        DisableFormHistory = true;
        ExtensionSettings = {
          # Bangs for Google
          "{0b6e9329-ab40-4973-b139-f10425bef6f5}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/{0b6e9329-ab40-4973-b139-f10425bef6f5}/latest.xpi";
            installation_mode = "normal_installed";
          };
          # Ctrl+Number to switch tabs
          "{84601290-bec9-494a-b11c-1baa897a9683}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/{84601290-bec9-494a-b11c-1baa897a9683}/latest.xpi";
            installation_mode = "normal_installed";
          };
          # Lesspass
          "contact@lesspass.com" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/contact@lesspass.com/latest.xpi";
            installation_mode = "normal_installed";
          };
        };
        HttpsOnlyMode = "enabled";
        OfferToSaveLoginsDefault = false;
        PasswordManagerEnabled = false;
        SanitizeOnShutdown = {
          Cache.type = true;
          Cookies.type = false;
          Downloads.type = true;
          FormData.type = true;
          History.type = true;
          Sessions.type = true;
          SiteSettings.type = true;
          OfflineApps.type = true;
          Locksed.type = true;
        };
      };
    };

    home.packages = [
      (pkgs.writeShellScriptBin "librewolf" ''
        export HOME="~/.local/user"
        exec "${config.programs.firefox.package}/bin/librewolf" "$@"
      '')
    ];
  };
}
