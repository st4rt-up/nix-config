{config, ...}: {
  theme = {
    colour = let
      olivia-pink = "f5bcad";
      black = "171717";
      yellow = "f6c177";
    in {
      primary = olivia-pink;
      background = black;

      inherit yellow;

      base00 = black;
      base01 = "242424";
      base02 = "333333";
      base03 = "5e4d47";
      # base04 = "413531";
      base04 = "9e786e";
      base05 = "dccdca";
      base06 = "d6d6d6";
      base07 = "493d39";
      base08 = "eb6f92";
      base09 = yellow;
      base0A = "c4a7e7";
      base0B = "3a94b7";
      base0C = "9fd4ff";
      base0D = olivia-pink;
      base0E = "ffcd7a";
      base0F = "493d39";
    };
  };
}
