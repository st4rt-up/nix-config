{
  inputs,
  # config,
  pkgs,
  lib,
  username,
  ...
}: let
  addonsPkgs = import inputs.nixpkgs-unstable {
    inherit (pkgs.stdenv.hostPlatform) system;
    config.allowUnfree = true;
  };

  inherit (builtins) elem;
  inherit (lib) getName;
  # link = config.home-manager.users.${username}.lib.file.mkOutOfStoreSymlink;
  # configPath = config.var.flake-path + "/modules/programs/zen-browser/dotfiles";
in {
  environment.sessionVariables = {MOZ_USE_XINPUT2 = "1";};
  # environment.systemPackages = with pkgs; [ brotab ];

  nixpkgs.config.allowUnfreePredicate = pkg:
    elem (getName pkg) [
      "improved-tube"
    ];

  home-manager.users.${username} = {
    imports = [inputs.zen-browser.homeModules.twilight];

    stylix.targets.zen-browser = {
      enable = false;
      profileNames = ["default"];
    };

    # keep keyboard shortcuts between versions
    # doesn't work
    # home.file.".zen/default/zen-keyboard-shortcuts.json".source = outOfStore configPath + "zen-keyboard-shortcuts.json";

    programs.zen-browser = {
      enable = true;
      nativeMessagingHosts = [
        pkgs.keepassxc
        # pkgs.brotab
      ];
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

          mods = [
            "d8b79d4a-6cba-4495-9ff6-d6d30b0e94fe" # better active tabs
            "253a3a74-0cc4-47b7-8b82-996a64f030d5" # floating history
            "cb15abdb-0514-4e09-8ce5-722cf1f4a20f" # hide extension name
            "c45c4894-d6bd-47fc-997a-0c4d015334f1" # no pinned tab reset button
            "4596d8f9-f0b7-4aeb-aa92-851222dc1888" # only close on hover
            "81fcd6b3-f014-4796-988f-6c3cb3874db8" # zen context menu
          ];

          keyboardShortcutsVersion = 14;
          keyboardShortcuts = [
            {
              id = "key_newNavigatorTab";
              key = "t";
              modifiers = {control = true;};
            } # new tab
            {
              id = "key_newNavigator";
              disabled = true;
            } # new window
            {
              id = "key_close";
              key = "q";
              modifiers = {control = true;};
            }
            {
              id = "key_closeWindow";
              disabled = true;
            }
            {
              id = "key_quitApplication";
              disabled = true;
            }

            {
              id = "viewBookmarksToolbarKb";
              disabled = true;
            }
            {
              id = "viewBookmarksSidebarKb";
              disabled = true;
            }
            {
              id = "bookmarkAllTabsKb";
              disabled = true;
            }

            {
              id = "key_search";
              disabled = true;
            }
            {
              id = "key_search2";
              disabled = true;
            }
            {
              id = "focusURLBar";
              key = "k";
              modifiers = {control = true;};
            }
            {
              id = "focusURLBar2";
              disabled = true;
            }
            {
              id = "key_openDownloads";
              disabled = true;
            }
            {
              id = "key_openAddons";
              key = "a";
              modifiers = {shift = true;};
            }

            {
              id = "key_toggleMute";
              key = "m";
              modifiers = {control = true;};
            }
            {
              id = "key_switchTextDirection";
              disabled = true;
            }
            {
              id = "key_togglePictureInPicture";
              disabled = true;
            }
            {
              id = "key_switchTextDirection";
              disabled = true;
            }
            {
              id = "key_toggleReaderMode";
              disabled = true;
            }
            {
              id = "viewGenaiChatSidebarKb";
              disabled = true;
            }

            {
              id = "zen-compact-mode-toggle";
              key = "c";
              modifiers = {
                control = true;
                alt = true;
              };
            }
            {
              id = "zen-compact-mode-show-sidebar";
              key = "s";
              modifiers = {
                control = true;
                alt = true;
              };
            }
            {
              id = "zen-split-view-grid";
              disabled = true;
            }
            {
              id = "zen-split-view-vertical";
              disabled = true;
            }
            {
              id = "zen-split-view-horizontal";
              disabled = true;
            }
            {
              id = "zen-split-view-unsplit";
              disabled = true;
            }
            {
              id = "zen-pinned-tab-reset-shortcut";
              disabled = true;
            }
            {
              id = "zen-copy-url";
              disabled = true;
            }
            {
              id = "zen-copy-url-markdown";
              disabled = true;
            }

            {
              id = "key_accessibility";
              disabled = true;
            }
            {
              id = "key_dom";
              disabled = true;
            }
            {
              id = "key_storage";
              disabled = true;
            }
            {
              id = "key_performance";
              disabled = true;
            }
            {
              id = "key_styleeditor";
              disabled = true;
            }
            {
              id = "key_netmonitor";
              disabled = true;
            }
            {
              id = "key_jsdebugger";
              disabled = true;
            }
            {
              id = "key_webconsole";
              disabled = true;
            }
            {
              id = "key_responsiveDesignMOde";
              disabled = true;
            }
            {
              id = "key_inspector";
              disabled = true;
            }
          ];

          extensions.packages = with addonsPkgs.callPackage
          inputs.firefox-addons {}; [
            ublock-origin
            clearurls
            don-t-fuck-with-paste
            istilldontcareaboutcookies
            bitwarden
            keepassxc-browser
            indie-wiki-buddy

            bonjourr-startpage
            brotab

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
