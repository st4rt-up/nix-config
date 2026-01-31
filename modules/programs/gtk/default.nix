{
  username,
  config,
  pkgs,
  ...
}: let
  inherit (config) theme;
  theme-name = "rose-pine-gtk";
in {
  environment.systemPackages = with pkgs; [
    rose-pine-cursor
    rose-pine-hyprcursor
    rose-pine-gtk-theme
    rose-pine-icon-theme
    papirus-icon-theme
    dconf-editor
  ];

  stylix.targets = {
    qt.enable = false;
  };

  qt.enable = true;
  qt.platformTheme = "gtk2";

  # ==== HOME LEVEL BELOW HERE
  home-manager.users.${username} = {
    stylix.targets = {
      qt.enable = false;
      kde.enable = false;
      gtk.enable = false;
    };

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

    qt = {
      enable = true;
      platformTheme.name = "gtk";
      style.name = theme-name;
    };

    home.pointerCursor = {
      gtk.enable = true;
      inherit (theme.cursor) size;
      inherit (theme.cursor.xcursor) package name;
    };
  };
}
