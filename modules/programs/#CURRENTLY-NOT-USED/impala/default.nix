{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    impala
  ];
  networking.wireless.iwd = {
    enable = true;
    settings = {
      IPv6 = {Enabled = false;};
      Settings = {AutoConnect = true;};
    };
  };

  networking.networkmanager.wifi.backend = "iwd";
}
