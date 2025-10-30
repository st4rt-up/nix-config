{
  inputs,
  username,
  ...
}: {
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
        };
      };

      policies = {
        DisableAppUpdate = true;
        DisableTelemetry = true;
        DontCheckDefaultBrowser = true;

        NoDefaultBookmarks = true;

        OfferToSaveLogins = false;
        AutofillAddressEnabled = false;
        AutofillCreditCardEnabled = false;

        DisableFeedbackCommands = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;

        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };

        ExtensionSettings = with builtins; let
          extension = shortId: uuid: {
            name = uuid;
            value = {
              install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
              installation_mode = "normal_installed";
            };
          };
        in
          listToAttrs [
            (extension "ublock-origin" "uBlock0@raymondhill.net")
            (extension "bitwarden-password-manager" "{446900e4-71c2-419f-a6a7-df9c091e268b}")
            (extension "bonjourr-startpage" "{4f391a9e-8717-4ba6-a5b1-488a34931fcb}")
            (extension "istilldontcareaboutcookies" "idcac-pub@guus.ninja")
            (extension "clearurls" "{74145f27-f039-47ce-a470-a662b129930a}")
            (extension "don-t-fuck-with-paste" "DontFuckWithPaste@raim.ist")
            (extension "minimaltwitter" "{e7476172-097c-4b77-b56e-f56a894adca9}")
            (extension "control-panel-for-twitter" "{5cce4ab5-3d47-41b9-af5e-8203eea05245}")
            (extension "reddit-enhancer" "{46abbc04-ce38-475f-9ef8-e0a4a59d0c9f}")
            # (extension "enhancer-for-youtube" "enhancerforyoutube@maximerf.addons.mozilla.org")
            (extension "youtube-addon" "{3c6bf0cc-3ae2-42fb-9993-0d33104fdcaf}")
            (extension "sponsorblock" "sponsorBlocker@ajay.app")
            (extension "dearrow" "deArrow@ajay.app")
            # (extension "2fas-two-factor-authentication" "admin@2fas.com")
          ];

        # To add additional extensions, find it on addons.mozilla.org, find
        # the short ID in the url (like https=//addons.mozilla.org/en-US/firefox/addon/!SHORT_ID!/)
        # Then, download the XPI by filling it in to the install_url template, unzip it,
        # run `jq .browser_specific_settings.gecko.id manifest.json` or
        # `jq .applications.gecko.id manifest.json` to get the UUID
      };
    };
  };
}
