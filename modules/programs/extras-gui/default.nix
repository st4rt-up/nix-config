{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    rquickshare # android quick share
    # networkmanagerapplet # configure networks gui
  ];
}
