{
  inputs,
  lib,
  pkgs,
  config,
  ...
}: let
  inherit (lib) mkOption types;
  inherit (inputs) stylix;
  inherit
    (types)
    str
    int
    float
    bool
    # attrs
    package
    ;

  # basic colours
  red = "dd3d43";
  orange = "ed9e45";
  yellow = "eacd45";
  lime = "7cec64";
  green = "378f21";
  sky-blue = "62ebe2";
  blue = "297ac1";
  indigo = "0d1865";
  purple = "4c2476";
  lilac = "9852e4";
  pink = "e55af5";

  # naming is kinda arbitrary ? should change
  white = "ffffff";
  light-gray = "a3a3a3";
  gray = "5f5f5f";
  dark-gray = "2d2d2d";
  basically-black = "0e0e0e";

  # this just lets me see more options at once
  # I need to find a better way to do this
  mkOpt = type: default:
    mkOption {
      inherit type default;
    };

  mkOptDesc = type: default: description:
    mkOption {
      inherit
        type
        default
        description
        ;
    };
in {
  imports = [stylix.nixosModules.stylix];

  options.theme = {
    colour =
      {
        primary = mkOpt str sky-blue;
        accent = mkOpt str red;
        background = mkOpt str "191724";
        background-alt = mkOpt str "191724";

        # default is rose pine
        # https://github.com/edunfelt/base16-rose-pine-scheme/blob/main/rose-pine.yaml
        base00 = mkOptDesc str "191724" "base16: Default background colour";
        base01 = mkOptDesc str "1f1d2e" "base16: Lighter background (status bars, line number, folding marks)";
        base02 = mkOptDesc str "26233a" "base16: Selection background";
        base03 = mkOptDesc str "6e6a86" "base16: Comments, invisibles, line highlighting";
        base04 = mkOptDesc str "908caa" "base16: Dark foreground (for status bars)";
        base05 = mkOptDesc str "e0def4" "base16: Default foreground, caret, delimiters, operators";
        base06 = mkOptDesc str "e0def4" "base16: Light foreground";
        base07 = mkOptDesc str "524f67" "base16: Light background";
        base08 = mkOptDesc str "eb6f92" "base16: Variables, XML tags, markup link text, markup lists, diff deleted";
        base09 = mkOptDesc str "f6c177" "base16: Integers, boolean, constants, XML attributes, Markup link uri";
        base0A = mkOptDesc str "ebbcba" "base16: Classes, markup bold, search text background";
        base0B = mkOptDesc str "31748f" "base16: Strings, inherited class, Markup code, diff inserted";
        base0C = mkOptDesc str "9ccfd8" "base16: Support, Regex, escape characters, Markup quotes";
        base0D = mkOptDesc str "c4a7e7" "base16: Functions, methods, attribute IDs, headings";
        base0E = mkOptDesc str "f6c177" "base16: Keywords, storage, selector, Markup italic, diff changed";
        base0F = mkOptDesc str "524f67" "base16: Deprecated, opening/closing embedded language tags";
      }
      // {
        # ==== colours for use in waybar config, etc
        # light-red = mkOpt str red;
        red = mkOpt str red;
        orange = mkOpt str orange;
        yellow = mkOpt str yellow;
        light-green = mkOpt str lime;
        green = mkOpt str green;
        light-blue = mkOpt str sky-blue;
        blue = mkOpt str blue;
        dark-blue = mkOpt str indigo;
        light-purple = mkOpt str lilac;
        purple = mkOpt str purple;
        pink = mkOpt str pink;

        # ==== gray values
        white = mkOpt str white;
        light-gray = mkOpt str light-gray;
        gray = mkOpt str gray;
        dark-gray = mkOpt str dark-gray;
        black = mkOpt str basically-black;
      };

    polarity = mkOpt str "dark";

    window-manager = {
      blur = mkOpt bool true;
      monitor-scaling = mkOpt float 2.0;

      rounding = mkOpt int 8;
      gaps-in = mkOpt int 6;
      gaps-out = mkOpt int (6 * 2);

      active-opacity = mkOpt float 0.92;
      inactive-opacity = mkOpt float 0.75;
      border-size = mkOpt int 2;
    };

    # application-launcher = {};

    cursor = {
      size = mkOpt int 28;

      hyprcursor = {
        name = mkOpt str "rose-pine-hyprcursor";
        package = mkOpt package pkgs.rose-pine-cursor;
      };

      xcursor = {
        name = mkOpt str "BreezeX-RosePine-Linux";
        package = mkOpt package pkgs.rose-pine-cursor;
      };
    };

    bar = {
      position = mkOpt str "bottom";
      height = mkOpt int 40;
      transparent = mkOpt bool false;
      transparent-buttons = mkOpt bool false;
      floating = mkOpt bool false;

      spacing = mkOpt int 5;
    };

    widgets = {
      rounding = mkOpt int config.theme.window-manager.rounding;
      padding = mkOpt int 5;

      border-size = mkOpt int 5;

      notification = {
        height = mkOpt int 200;
        width = mkOpt int 800;
      };
    };

    fonts = {
      monospace.name = mkOpt str "iMWritingMono Nerd Font Propo";
      monospace.package = mkOpt package pkgs.nerd-fonts.im-writing;

      sansSerif.name = mkOpt str "Atkinson Hyperlegible";
      sansSerif.package = mkOpt package pkgs.atkinson-hyperlegible;

      serif.name = mkOpt str "iMWritingMono Nerd Font Propo";
      serif.package = mkOpt package pkgs.nerd-fonts.im-writing;

      emoji.name = mkOpt str "Noto Color Emoji";
      emoji.package = mkOpt package pkgs.noto-fonts-color-emoji;

      sizes = {
        applications = mkOpt int 11;
        desktop = mkOpt int 16;
        popups = mkOpt int 11;
        terminal = mkOpt int 11;
      };
    };

    enableStylix = mkOpt bool true;

    # create enable option in theme for stylix
  };
}
