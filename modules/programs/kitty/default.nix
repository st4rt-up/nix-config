# currently requires home-manager
{
  config,
  username,
  pkgs,
  lib,
  ...
}: let
  inherit (config) theme;
  inherit (lib) mkForce;
in {
  home-manager.users.${username} = {
    home.packages = with pkgs; [
      kitty-themes
    ];

    programs.kitty = {
      enable = true;
      themeFile = "Bright_Lights"; #Parasio Dark
      settings = {
        # ==== FONT SETTINGS
        font_size = theme.fonts.sizes.terminal;

        font_family = theme.fonts.monospace.name;
        # bold_font = "iMWritingMono Nerd Font Mono";
        # italic_font = "iMWritingMono Nerd Font Mono";
        # bold_italic_font = "iMWritingMono Nerd Font Mono";

        # ==== CURSOR SETTINGS
        cursor_trail = 1;
        cursor_trail_decay = "0.05 0.1";
        # cursor = "#ffffff";
        # cursor_shape = "beam";

        # ==== BG
        background_opacity = mkForce (toString theme.window-manager.active-opacity);
        background_blur =
          if theme.window-manager.blur
          then 1
          else 0;
      };
    };
  };
}
