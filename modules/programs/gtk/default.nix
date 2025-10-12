{
  username,
  config,
  pkgs,
  ...
}: let
  inherit (config) theme;
in {
  environment.systemPackages = with pkgs; [rose-pine-cursor];
  home-manager.users.${username} = {
    gtk = {
      enable = true;
      cursorTheme.name = theme.cursor.xcursor.name;
      cursorTheme.size = theme.cursor.size;
    };

    home.pointerCursor = {
      gtk.enable = true;

      inherit (theme.cursor.xcursor) package name;
      inherit (theme.cursor) size;
    };
  };
}
