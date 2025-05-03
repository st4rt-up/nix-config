{
  config,
  pkgs,
  theme,
  ...
}: {
  home.packages = with pkgs; [rose-pine-cursor];
  gtk = {
    enable = true;
    cursorTheme.name = theme.cursor.xcursor.name;
    cursorTheme.size = theme.cursor.size;
  };

  home.pointerCursor = {
    gtk.enable = true;

    package = theme.cursor.xcursor.package;
    name = theme.cursor.xcursor.name;
    size = theme.cursor.size;
  };
}
