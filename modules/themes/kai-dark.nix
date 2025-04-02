# thanks https://github.com/anotherhadi/nixy/blob/main/themes/nixy.nix
{
  lib,
  pkgs,
  ...
}: let
  olivia-pink = "#F1BEB0";
  olivia-pink-darker = "#85594d";
  green = "#afd8b7";
  blue = "#5ca7e6";
  light-blue = "#9fd4ff";
  indigo = "#094074";
  yellow = "#ffcd7a";
  purple = "#9d78ff";
  red = "#f9636a";

  white = "#ffffff";
  basically-white = "#d6d6d6";

  black = "#171717";
  gray = "#242424";
  light-gray = "3d3d3d";
in {
  options.theme = lib.mkOption {
    type = lib.types.attrs;

    default = {
      rounding = 8;
      gaps-in = 6;
      gaps-out = 10 * 2;
      active-opacity = 0.92;
      inactive-opacity = 0.88;
      blur = true;
      border-size = 2;
      # animation-speed = "fast";
      # fetch = "none";

      cursor-size = 28;

      bar = {
        position = "bottom";
        transparent = false;
        transparent-buttons = false;
        floating = true;
        height = 40;
      };
    };
  };

  config.stylix = {
    enable = true;

    opacity.applications = 0.94;
    base16Scheme = {
      base00 = black; # default background
      base01 = gray; # lighter background
      base02 = light-gray; # selection background

      base03 = olivia-pink-darker; # comments
      base04 = blue; # dark foreground
      base05 = basically-white; # default foreground

      base06 = white; # light foreground 1
      base07 = light-gray; # light foreground 2

      base08 = yellow; # Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
      base09 = light-blue; # Integers, Boolean, Constants, XML Attributes, Markup Link Url
      base0B = olivia-pink; # Strings, Inherited Class, Markup Code, Diff Inserted
      base0C = yellow; # Support, Regular Expressions, Escape Characters, Markup Quotes
      base0D = olivia-pink; # Functions, Methods, Attribute IDs, Headings, Accent color
      base0E = blue; # Keywords, Storage, Selector, Markup Italic, Diff Changed
      base0F = red; # Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
      base0A = olivia-pink; # Classes, Markup Bold, Search Text Background
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.blex-mono;
        name = "BlexMono Nerd Font";
      };

      sansSerif = {
        package = pkgs.nerd-fonts.blex-mono;
        name = "Atkinson Hyperlegible Next";
        # package = pkgs.lora;
        # name = "Lora,Lora Semibold";
      };

      serif = {
        package = pkgs.lora;
        name = "Lora";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };

      sizes = {
        applications = 11;
        desktop = 11;
        popups = 11;
        terminal = 11;
      };
    };
  };
}
