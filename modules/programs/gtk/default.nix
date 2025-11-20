{
  username,
  config,
  pkgs,
  ...
}: let
  inherit (config) theme;
  theme-name = "rose-pine-gtk";
  theme-package = pkgs.rose-pine-gtk-theme;
in {
  environment.systemPackages = with pkgs; [
    rose-pine-cursor
    rose-pine-hyprcursor
    rose-pine-gtk-theme
  ];

  stylix.targets = {
    qt.enable = false;
  };

  qt = {
    enable = true;
    platformTheme = "gtk2";
  };

  # ==== HOME LEVEL BELOW HERE
  home-manager.users.${username} = {
    stylix.targets = {
      qt.enable = false;
      kde.enable = false;
      gtk.enable = true;
    };

    gtk = {
      enable = true;
      cursorTheme = {
        inherit (theme.cursor.xcursor) name;
        inherit (theme.cursor) size;
      };

      #      theme = {
      #        name = theme-name;
      #        package = theme-package;
      #      };

      iconTheme = {
        name = "rose-pine-icons";
        package = theme-package;
      };

      gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
      gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
    };

    qt = {
      enable = true;
      platformTheme.name = "gtk";
      style = {
        name = theme-name;
        package = theme-package;
      };
    };

    home.pointerCursor = {
      gtk.enable = true;

      inherit (theme.cursor.xcursor) package name;
      inherit (theme.cursor) size;
    };
  };
}
