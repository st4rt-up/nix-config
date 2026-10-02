{
  modules.rose-pine-cursor = {
    home = {pkgs, ...}: {
      gtk.enable = true;

      home.packages = with pkgs; [
        rose-pine-cursor
        rose-pine-hyprcursor
        # rose-pine-gtk-theme
        # rose-pine-icon-theme
        # papirus-icon-theme
        # dconf-editor
      ];
      home.pointerCursor = {
        enable = true;
        gtk.enable = true;
        x11.enable = true;

        size = 28;
        name = "BreezeX-RosePine-Linux";
        package = pkgs.rose-pine-cursor;

        # hyprcursor.name = "";
      };
    };
  };
}
