{
  inputs,
  pkgs,
  lib,
  username,
  ...
}: let
  # inherit (builtins) elem;
  # inherit (config.lib) getName;
  addonsPkgs = import inputs.nixpkgs-unstable 
    { inherit (pkgs) system;
      config.allowUnfree = true;
    };
in {
  environment.sessionVariables = {
    MOZ_USE_XINPUT2 = "1";
  };

  #  nixpkgs.config.allowUnfreePredicate = pkg:
  #    builtins.elem (lib.getName pkg) [
  #      "improved-tube"
  #    ];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "improved-tube"
    ];

  home-manager.users.${username} = {
    imports = [
      inputs.zen-browser.homeModules.beta
    ];

    stylix.targets.zen-browser = {
      enable = true;
      profileNames = ["default"];
    };

    programs.zen-browser = {
      enable = true;

      profiles = {
        default = {
          id = 0;
          name = "default";
          isDefault = true;

          search = {
            force = true;
            default = "ddg";
            privateDefault = "ddg";
          };

          extensions.packages = with 
            addonsPkgs.callPackage 
            inputs.firefox-addons {}; 
          [
            ublock-origin
            clearurls
            don-t-fuck-with-paste
            istilldontcareaboutcookies
            bitwarden

            bonjourr-startpage

            save-all-images-webextension

            improved-tube
            dearrow
            sponsorblock
            control-panel-for-twitter
          ];
        };
      };

      policies = {
        # categories from nix wiki:
        # https://wiki.nixos.org/wiki/Firefox

        # == updates and background services
        AppAutoUpdate = false;
        BackgroundAppUpdate = false;
        DisableAppUpdate = true;

        # == feature disabling
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableFirefoxAccounts = true;
        DisableFirefoxScreenshots = true;
        DisableForgetButton = true;
        DisableMasterPasswordCreation = true;
        DisableProfileImport = true;
        DisableProfileRefresh = true;
        DisableTelemetry = true;

        OfferToSaveLogins = false;
        AutofillAddressEnabled = false;
        AutofillCreditCardEnabled = false;

        # qol and annoyances
        DontCheckDefaultBrowser = true;
        NoDefaultBookmarks = true;
        DisableFeedbackCommands = true;

        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
      };
    };
  };
}
