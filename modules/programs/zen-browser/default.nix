{
  inputs,
  # config,
  pkgs,
  lib,
  username,
  ...
}: let
  addonsPkgs = import inputs.nixpkgs-unstable {
    inherit (pkgs) system;
    config.allowUnfree = true;
  };

  inherit (builtins) elem;
  inherit (lib) getName;
  # configPath = config.var.flake-path + "/modules/programs/zen-browser/dotfiles";
  # outOfStore = config.home-manager.users.${username}.lib.file.mkOutOfStoreSymlink;
in {
  environment.sessionVariables = {
    MOZ_USE_XINPUT2 = "1";
  };

  nixpkgs.config.allowUnfreePredicate = pkg:
    elem (getName pkg) [
      "improved-tube"
    ];

  home-manager.users.${username} = {
    imports = [inputs.zen-browser.homeModules.beta];

    stylix.targets.zen-browser = {
      enable = false;
      profileNames = ["default"];
    };

    # keep keyboard shortcuts between versions
    # home.file.".zen/default/zen-keyboard-shortcuts.json".source = outOfStore configPath + "zen-keyboard-shortcuts.json";

    programs.zen-browser = {
      enable = true;
      nativeMessagingHosts = [pkgs.keepassxc];
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

          extensions.packages = with addonsPkgs.callPackage
          inputs.firefox-addons {}; [
            ublock-origin
            clearurls
            don-t-fuck-with-paste
            istilldontcareaboutcookies
            bitwarden
            keepassxc-browser

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
