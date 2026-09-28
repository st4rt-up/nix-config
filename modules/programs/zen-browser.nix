{
  inputs,
  lib,
  ...
}: {
  modules.zen-browser = {
    nixos = {};
    home = {pkgs, ...}: {
      imports = [inputs.zen-browser.homeModules.beta];
      programs.zen-browser = {
        enable = true;

        profiles.default = {
          id = 0;
          name = "default";
          isDefault = true;

          search = {
            force = true;
            default = "ddg";
            privateDefault = "ddg";
          };

          # ==== zen mods
          mods = [
            "d8b79d4a-6cba-4495-9ff6-d6d30b0e94fe" # better active tabs
            "253a3a74-0cc4-47b7-8b82-996a64f030d5" # floating history
            "cb15abdb-0514-4e09-8ce5-722cf1f4a20f" # hide extension name
            "c45c4894-d6bd-47fc-997a-0c4d015334f1" # no pinned tab reset button
            "4596d8f9-f0b7-4aeb-aa92-851222dc1888" # only close on hover
            "81fcd6b3-f014-4796-988f-6c3cb3874db8" # zen context menu
          ];

          # ==== extensions
          extensions.packages = with (import inputs.nixpkgs-unstable {
            inherit (pkgs.stdenv.hostPlatform) system;
            config.allowUnfree = true;
          }).callPackage
          inputs.firefox-addons {
            buildMozillaXpiAddon = lib.makeOverridable (
              {
                pname,
                version,
                addonId,
                url ? "",
                urls ? [],
                sha256,
                meta,
                ...
              }:
                pkgs.stdenv.mkDerivation {
                  name = "${pname}-${version}";
                  inherit meta;
                  src = pkgs.fetchurl {inherit url urls sha256;};
                  preferLocalBuild = true;
                  allowSubstitutes = true;
                  passthru = {inherit addonId;};
                  buildCommand = ''
                    dst="$out/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}"
                    mkdir -p "$dst"
                    install -v -m644 "$src" "$dst/${addonId}.xpi"
                  '';
                }
            );
          }; [
            ublock-origin
            clearurls
            don-t-fuck-with-paste
            istilldontcareaboutcookies
            # bitwarden
            keepassxc-browser
            indie-wiki-buddy

            bonjourr-startpage
            # brotab

            save-all-images-webextension

            youtube-recommended-videos #unhook
            improved-tube
            dearrow
            sponsorblock
            control-panel-for-twitter
          ];

          # ==== binds
          keyboardShortcutsVersion = 20;
          keyboardShortcuts = let
            mkBind = key: id: {
              control ? false,
              alt ? false,
              shift ? false,
            }: {
              inherit key id;
              modifiers = {inherit control shift alt;};
            };

            unbind = id: {
              inherit id;
              disabled = true;
            };
          in
            [
              (mkBind "t" "key_newNavigatorTab" {control = true;})
              (mkBind "q" "key_close" {control = true;})
              # (mkBind "w" "key_close" {control = true;})
              (mkBind "k" "focusURLBar" {control = true;})
              (mkBind "a" "key_openAddons" {shift = true;})
              (mkBind "m" "key_toggleMute" {control = true;})

              (mkBind "c" "zen-compact-mode-toggle" {
                control = true;
                alt = true;
              })
              (mkBind "s" "zen-compact-mode-show-sidebar" {
                control = true;
                alt = true;
              })
            ]
            ++ map unbind [
              "key_newNavigator"
              "key_closeWindow"
              "key_quitApplication"
              "viewBookmarksToolbarKb"
              "viewBookmarksSidebarKb"
              "bookmarkAllTabsKb"
              "key_search"
              "key_search2"
              "focusURLBar2"
              "key_openDownloads"

              "key_switchTextDirection"
              "key_togglePictureInPicture"
              "key_switchTextDirection"
              "key_toggleReaderMode"
              "viewGenaiChatSidebarKb"

              "zen-split-view-grid"
              "zen-split-view-vertical"
              "zen-split-view-horizontal"
              "zen-split-view-unsplit"
              "zen-pinned-tab-reset-shortcut"
              "zen-copy-url"
              "zen-copy-url-markdown"
              "key_accessibility"
              "key_dom"
              "key_storage"
              "key_performance"
              "key_styleeditor"
              "key_netmonitor"
              "key_jsdebugger"
              "key_webconsole"
              "key_responsiveDesignMode"
              "key_inspector"
            ];
        }; # // profiles.default

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
  };
}
