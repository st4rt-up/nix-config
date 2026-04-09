{
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
}
