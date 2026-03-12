_: let
  olivia-pink = "f5bcad"; #f5bcad
  black = "171717"; #171717
  gray-1 = "272727"; #272727
  gray-2 = "333333"; #333333
  yellow = "ffcd7a"; #ffcd7a
  pink = "eb4f92"; #eb4f92
  purple = "c5a7e7"; #c5a7e7
  light-blue = "9fd4ff"; #9fd4ff
  teal-blue = "3a94b7"; #3a94b7

  not-quite-white = "dccdca";
  # olivia-dark-1 = "5e4d47";
  olivia-dark-2 = "9e786e";
in {
  theme = {
    enableStylix = true;
    polarity = "dark";
    colour = {
      primary = olivia-pink;
      background = black;
      background-alt = gray-1;
      foreground = not-quite-white;

      inherit purple pink yellow;

      base00 = black; # #171717 default bg
      base01 = gray-1; #272727 alternate bg
      base02 = gray-2; #333333 selection bg
      base03 = olivia-dark-2; #9e786e
      base04 = "ffc3b0"; #ffc3b0 alternate text
      base05 = not-quite-white; #dccdca default text
      base06 = "d6d6d6"; #d6d6d6
      base07 = "7c6f6a"; #7c6f6a
      base08 = pink; #eb4f92 error
      base09 = "e07065"; #e07065 urgent
      base0A = purple; #c5a7e7 warning
      base0B = teal-blue; #3a94b7
      base0C = light-blue; #9fd4ff
      base0D = olivia-pink; #f5bcad
      base0E = yellow; #ffcd7a
      base0F = olivia-dark-2; #9e786e
    };

    window-manager = {
      blur.enable = false;
      shadow.enable = true;
      border.size = 6;
      border.colour.active = light-blue;
      gaps.inside = 12;
      gaps.outside = 9;
      opacity.active = 0.99;
      opacity.inactive = 0.96;
    };

    widgets = {
      rounding = 0;
      padding = 10;
      border.size = 3;
      notification.font.size = 9;
    };

    bar = {
      position = "bottom";
      height = 40;
      # spacing = 5;
    };

    launcher.font.size = 11;
    terminal.font.size = 9;

    niri = {
      enable = true;
      focus-ring = true;
      border = false;
    };

    kitty.enable = true;
    mako.enable = true;
    rofi.enable = true;
    rofi-power-menu = {
      enable = true;
      offset.vertical = -2;
      offset.horizontal = -2;
      font.size = 12;
    };
  };
}
