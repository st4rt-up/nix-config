{
  modules.locale.nixos = {
    i18n.defaultLocale = "en_CA.UTF-8";

    services.automatic-timezoned.enable = true;
    location.provider = "geoclue2";

    services.geoclue2.enable = true;
    # time.timeZone = "America/Toronto";
    # time.timeZone = "Asia/Tokyo";
  };
}
