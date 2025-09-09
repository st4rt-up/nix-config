{
  lib,
  config,
  pkgs,
  ...
}: let
  inherit
    (lib)
    mkEnableOption
    mkOption
    mkDefault
    mkIf
    types
    ;
in let
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
in {
  options.theme = {
    colour = {
      primary = mkOption {
        type = types.str;
        default = sky-blue;
      };
      accent = mkOption {
        type = types.str;
        default = red;
      };

      background = mkOption {
        type = types.str;
        default = "191724";
      };

      background-alt = mkOption {
        type = types.str;
        default = "191724";
      };

      # default is rose pine
      # https://github.com/edunfelt/base16-rose-pine-scheme/blob/main/rose-pine.yaml

      base00 = mkOption {
        type = types.str;
        default = "191724";
      };
      base01 = mkOption {
        type = types.str;
        default = "1f1d2e";
      };
      base02 = mkOption {
        type = types.str;
        default = "26233a";
      };
      base03 = mkOption {
        type = types.str;
        default = "6e6a86";
      };

      base04 = mkOption {
        type = types.str;
        default = "908caa";
      };
      base05 = mkOption {
        type = types.str;
        default = "e0def4";
      };
      base06 = mkOption {
        type = types.str;
        default = "e0def4";
      };
      base07 = mkOption {
        type = types.str;
        default = "524f67";
      };

      base08 = mkOption {
        type = types.str;
        default = "eb6f92";
      };
      base09 = mkOption {
        type = types.str;
        default = "f6c177";
      };
      base0A = mkOption {
        type = types.str;
        default = "ebbcba";
      };
      base0B = mkOption {
        type = types.str;
        default = "31748f";
      };
      base0C = mkOption {
        type = types.str;
        default = "9ccfd8";
      };
      base0D = mkOption {
        type = types.str;
        default = "c4a7e7";
      };
      base0E = mkOption {
        type = types.str;
        default = "f6c177";
      };
      base0F = mkOption {
        type = types.str;
        default = "524f67";
      };

      # ==== colours for use in waybar config, etc

      red = mkOption {
        type = types.str;
        default = red;
      };
      orange = mkOption {
        type = types.str;
        default = orange;
      };
      yellow = mkOption {
        type = types.str;
        default = yellow;
      };
      light-green = mkOption {
        type = types.str;
        default = lime;
      };
      green = mkOption {
        type = types.str;
        default = green;
      };
      light-blue = mkOption {
        type = types.str;
        default = sky-blue;
      };
      blue = mkOption {
        type = types.str;
        default = blue;
      };
      dark-blue = mkOption {
        type = types.str;
        default = indigo;
      };
      light-purple = mkOption {
        type = types.str;
        default = lilac;
      };
      purple = mkOption {
        type = types.str;
        default = purple;
      };
      pink = mkOption {
        type = types.str;
        default = pink;
      };

      # ==== gray values

      white = mkOption {
        type = types.str;
        default = white;
      };
      light-gray = mkOption {
        type = types.str;
        default = light-gray;
      };
      gray = mkOption {
        type = types.str;
        default = gray;
      };
      dark-gray = mkOption {
        type = types.str;
        default = dark-gray;
      };
      black = mkOption {
        type = types.str;
        default = basically-black;
      };
    };

    polarity = mkOption {
      type = types.str;
      default = "dark";
    };

    rounding = mkOption {
      type = types.int;
      default = 8;
    };
    gaps-in = mkOption {
      type = types.int;
      default = 6;
    };
    gaps-out = mkOption {
      type = types.int;
      default = 6 * 2;
    };
    active-opacity = mkOption {
      type = types.float;
      default = 0.92;
    };
    inactive-opacity = mkOption {
      type = types.float;
      default = 0.75;
    };
    blur = mkOption {
      type = types.bool;
      default = true;
    };
    border-size = mkOption {
      type = types.int;
      default = 2;
    };

    cursor = {
      size = mkOption {
        type = types.int;
        default = 28;
      };

      hyprcursor = {
        name = mkOption {
          type = types.str;
          default = "rose-pine-hyprcursor";
        };
        # package = mkOption {
        #   type = types.package;
        #   default = pkgs.rose-pine-cursor;
        # };
      };
      xcursor = {
        name = mkOption {
          type = types.str;
          default = "BreezeX-RosePine-Linux";
        };
        package = mkOption {
          type = types.package;
          default = pkgs.rose-pine-cursor;
        };
      };
    };
    cursor-size = mkOption {
      type = types.int;
      default = 28;
    };

    monitor-scaling = mkOption {
      type = types.float;
      default = 2.0;
    };

    bar = {
      position = mkOption {
        type = types.str;
        default = "bottom";
      };
      height = mkOption {
        type = types.int;
        default = 40;
      };
      transparent = mkOption {
        type = types.bool;
        default = false;
      };
      transparent-buttons = mkOption {
        type = types.bool;
        default = false;
      };
      floating = mkOption {
        type = types.bool;
        default = false;
      };
    };

    fonts = {
      monospace = {
        name = mkOption {
          type = types.str;
          default = "iMWritingMono Nerd Font Propo";
        };

        package = mkOption {
          type = types.package;
          default = pkgs.nerd-fonts.im-writing;
        };
      };

      sansSerif = {
        name = mkOption {
          type = types.str;
          default = "Atkinson Hyperlegible";
        };

        package = mkOption {
          type = types.package;
          default = pkgs.atkinson-hyperlegible;
        };
      };

      serif = {
        name = mkOption {
          type = types.str;
          default = "iMWritingMono Nerd Font Propo";
        };

        package = mkOption {
          type = types.package;
          default = pkgs.nerd-fonts.im-writing;
        };
      };

      emoji = {
        name = mkOption {
          type = types.str;
          default = "Noto Color Emoji";
        };

        package = mkOption {
          type = types.package;
          default = pkgs.noto-fonts-emoji;
        };
      };

      sizes = {
        applications = mkOption {
          type = types.int;
          default = 11;
        };

        desktop = mkOption {
          type = types.int;
          default = 16;
        };

        popups = mkOption {
          type = types.int;
          default = 11;
        };

        terminal = mkOption {
          type = types.int;
          default = 11;
        };
      };
    };

    enableStylix = mkOption {
      type = types.bool;
      default = true;
    };
  };

  # create enable option in theme for stylix
}
