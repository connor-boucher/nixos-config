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
      profiles.default = {
        search = {
          default = "ddg";
          force = true;
        };
        settings = {
          "browser.startup.homepage" = "https://start.duckduckgo.com/";
          "browser.urlbar.suggest.bookmark" = false;
          "browser.urlbar.suggest.history" = false;
          "browser.urlbar.suggest.openpage" = false;
          "browser.urlbar.suggest.quickactions" = false;
          "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
          "browser.urlbar.suggest.quicksuggest.sponsored" = false;

          "privacy.clearOnShutdown.cookies" = false;
          "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
          "privacy.sanitize.sanitizeOnShutdown" = true;

          "toolkit.telemetry.archive.enabled" = false;
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.server" = "";
          "toolkit.telemetry.unified" = false;
          "extensions.webcompat-reporter.enabled" = false;
          "datareporting.policy.dataSubmissionEnabled" = false;
          "datareporting.healthreport.uploadEnabled" = false;
          "browser.ping-centre.telemetry" = false;
          "browser.urlbar.eventTelemetry.enabled" = false;
        };
        extensions = {
          packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
            ctrl-number-to-switch-tabs
            lesspass
            new-tab-override
            ublock-origin
            vimium
          ];
          force = true;
        };
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
