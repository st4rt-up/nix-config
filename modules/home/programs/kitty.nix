{
  config,
  theme,
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    kitty-themes
  ];

  programs.kitty = {
    enable = true;
    themeFile = "Bright_Lights"; #Parasio Dark
    settings = {
      # -=
      # font settings

      font_family = config.stylix.fonts.monospace.name;
      # bold_font = "iMWritingMono Nerd Font Mono";
      # italic_font = "iMWritingMono Nerd Font Mono";
      # bold_italic_font = "iMWritingMono Nerd Font Mono";

      font_size = config.stylix.fonts.sizes.terminal;

      # -=
      # cursor settings

      # cursor = "#ffffff";
      # cursor_shape = "beam";

      cursor_trail = 1;
      cursor_trail_decay = "0.05 0.1";

      # -=
      background_opacity = lib.mkForce theme.active-opacity;
      background_blur =
        if theme.blur
        then 1
        else 0;
    };
  };
}
