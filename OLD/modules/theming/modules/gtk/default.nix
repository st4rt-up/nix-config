{
  username,
  config,
  pkgs,
  ...
}: let
  inherit (config) theme;
in {
  environment.systemPackages = with pkgs; [
    rose-pine-cursor
    rose-pine-hyprcursor
    rose-pine-gtk-theme
    rose-pine-icon-theme
    papirus-icon-theme
    dconf-editor
  ];

  # ==== HOME LEVEL BELOW HERE
  home-manager.users.${username} = {
    gtk = {
      enable = true;
      cursorTheme = {
        inherit (theme.cursor.xcursor) name;
        inherit (theme.cursor) size;
      };

      iconTheme.name = "oomox-rose-pine-dawn";
      gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
      gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
    };

    home.pointerCursor = {
      gtk.enable = true;
      inherit (theme.cursor) size;
      inherit (theme.cursor.xcursor) package name;
    };
  };
}
