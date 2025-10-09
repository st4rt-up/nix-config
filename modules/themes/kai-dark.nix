_: {
<<<<<<< HEAD
=======
  environment.variables.NEWT_COLORS = "root=#FFFFFF,#000000 border=#FF00FF,#000000 window=#000000,#000000 shadow=#000000,#000000 title=#FF00FF,#000000 button=#000000,#FF00FF button_active=#000000,#FFFF00 actbutton=#FFFF00,#000000 compactbutton=#FFFF00,#000000 checkbox=#FF0000,#000000 entry=#00FF00,#000000 disentry=#000000,#000000 textbox=#00FF00,#000000 acttextbox=#FF00FF,#000000 label=#00FFFF,#000000 listbox=#00FF00,#000000 actlistbox=#FF00FF,#000000 sellistbox=#FF0000,#000000 actsellistbox=#000000,#FFFF00";

>>>>>>> 0e95b36 (updated system, added atuin)
  theme = {
    colour = let
      olivia-pink = "f5bcad";
      black = "171717";
      gray-1 = "272727";
      gray-2 = "333333";
      yellow = "ffcd7a"; #f6c177
      pink = "eb6f92";
      purple = "c4a7e7";
      light-blue = "9fd4ff";
      blue = "3a94b7";

      # olivia-dark-1 = "5e4d47";
      olivia-dark-2 = "9e786e";
    in {
      primary = olivia-pink;
      background = black;

      inherit yellow;

      base00 = black;
      base01 = gray-1; # gray-1
      base02 = gray-2; # gray-2
      base03 = olivia-dark-2; # olivia-black
      base04 = "ffc3b0"; #olivia-dark-2; # olivia-black-2
      base05 = "dccdca"; # olivia-white
      base06 = "d6d6d6"; # basically-white
      base07 = "7c6f6a"; # olivia...gray??
      base08 = pink; # pink
      base09 = yellow;
      base0A = purple; # purple
      base0B = blue;
      base0C = light-blue; # light blue
      base0D = olivia-pink;
      base0E = yellow; # yellow
      base0F = olivia-dark-2; # dark-olivia-pink candidate 1
    };

    gaps-in = 5;
    gaps-out = 9;

    blur = false;

    active-opacity = 0.97;
    inactive-opacity = 0.9;

    fonts.sizes.terminal = 9;
  };
}
