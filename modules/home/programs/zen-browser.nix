{
  inputs,
  system,
  var,
  pkgs,
  ...
}: {
  imports = [
    inputs.zen-browser.homeModules.twilight-official
  ];

  programs.zen-browser = {
    enable = true;
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
      DisablePocket = true; # save webs for later reading

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

          # (extension "2fas-two-factor-authentication" "admin@2fas.com")
          (extension "sponsorblock" "sponsorBlocker@ajay.app")
          (extension "dearrow" "deArrow@ajay.app")
          # (extension "enhancer-for-youtube" "enhancerforyoutube@maximerf.addons.mozilla.org")
          (extension "don-t-fuck-with-paste" "DontFuckWithPaste@raim.ist")
          (extension "clearurls" "{74145f27-f039-47ce-a470-a662b129930a}")
          (extension "bonjourr-startpage" "{4f391a9e-8717-4ba6-a5b1-488a34931fcb}")
        ];

      # To add additional extensions, find it on addons.mozilla.org, find
      # the short ID in the url (like https=//addons.mozilla.org/en-US/firefox/addon/!SHORT_ID!/)
      # Then, download the XPI by filling it in to the install_url template, unzip it,
      # run `jq .browser_specific_settings.gecko.id manifest.json` or
      # `jq .applications.gecko.id manifest.json` to get the UUID
    };
  };
}
