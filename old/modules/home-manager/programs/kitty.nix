{pkgs, ...}: {
  home.packages = with pkgs; [
    kitty-themes
  ];

  programs.kitty = {
    enable = true;
    themeFile = "Bright_Lights"; #Parasio Dark
    settings = {
      # -=
      # font settings

      font_family = "iMWritingMono Nerd Font Mono:style=Regular";
      bold_font = "iMWritingMono Nerd Font Mono:style=Bold";
      italic_font = "iMWritingMono Nerd Font Mono:style=Italic";
      bold_italic_font = "iMWritingMono Nerd Font Mono:style=Bold Italic";

      # font_size = 11.0;

      # -=
      # cursor settings

      # cursor = "#ffffff";
      # cursor_shape = "beam";

      cursor_trail = 1;
      cursor_trail_decay = "0.05 0.1";

      # -=
      background_opacity = 0.9;
      background_blur = 1;
    };
  };
}
