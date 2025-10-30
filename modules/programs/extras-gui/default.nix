{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    rquickshare # android quick share

    gimp
    gimpPlugins

    godot
  ];
}
