{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [rose-pine-cursor];
  gtk = {
    enable = true;
    cursorTheme.name = "BreezeX-RosePine-Linux";
    cursorTheme.size = config.theme.cursor-size;
  };
}
