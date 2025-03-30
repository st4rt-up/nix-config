# thanks https://github.com/anotherhadi/nixy/blob/main/themes/nixy.nix
{
  lib,
  pkgs,
  ...
}: let
  olivia-pink = "#F1BEB0";
  olivia-pink-darker = "#b9897c";
  green = "#afd8b7";
  blue = "#68b3f3";
  yellow = "#edbc69";
  purple = "#d9b1ff";

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
      gaps-in = 10;
      gaps-out = 10 * 2;
      active_opacity = 0.92;
      inactive_opacity = 0.88;
      blur = true;
      border_size = 2;
      # animation-speed = "fast";
      # fetch = "none";

      bar = {
        position = "top";
        transparent = false;
        transparentButtons = false;
        floating = true;
      };
    };
  };

  config.stylix = {
    enable = true;

    base16Scheme = {
      base00 = black; # default background
      base01 = gray; # lighter background
      base02 = light-gray; # selection background

      base03 = "#9ca0b0"; # comments
      base04 = blue; # dark foreground
      base05 = basically-white; # default foreground

      base06 = white; # light foreground 1
      base07 = green; # light foreground 2

      base08 = blue; # Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
      base09 = blue; # Integers, Boolean, Constants, XML Attributes, Markup Link Url
      base0B = olivia-pink-darker; # Strings, Inherited Class, Markup Code, Diff Inserted
      base0C = yellow; # Support, Regular Expressions, Escape Characters, Markup Quotes
      base0D = olivia-pink; # Functions, Methods, Attribute IDs, Headings, Accent color
      base0E = white; # Keywords, Storage, Selector, Markup Italic, Diff Changed
      base0F = purple; # Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
      base0A = olivia-pink; # Classes, Markup Bold, Search Text Background
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.im-writing;
        name = "iMWritingMono Nerd Font Mono:style=Regular";
      };

      sansSerif = {
        package = pkgs.nerd-fonts.im-writing;
        name = "iMWritingQuat Nerd Font Propo:style=Regular";
      };

      serif = {
        package = pkgs.nerd-fonts.fira-code;
        name = "Fira Code Nerd Font Propo";
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
