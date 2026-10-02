{inputs, ...}: {
  modules = {
    stylix = {
      nixos = {
        imports = [inputs.stylix.nixosModules.stylix];
        stylix = {
          enable = true;
          polarity = "dark";

          # opacity.terminal = 0.96;
        };
      };

      home.stylix.targets = {
        qt.enable = true;
        kde.enable = true;
        gtk.enable = false;

        zen-browser = {
          enable = true;
          profileNames = ["default"];
        };

        rofi.enable = false;
        mako.enable = false;
        tmux.enable = false;
        obsidian.enable = false;

        nixcord = {
          enable = true;
          colors.enable = false;
        };

        vencord.enable = false;
        vesktop.enable = false;
      };
    };

    stylix-icons.nixos = {pkgs, ...}: {
      stylix.icons = {
        enable = true;
        #dark = "Papirus-Dark";
        #light = "Papirus";
        #package = pkgs.papirus-icon-theme;

        dark = "rose-pine-icons";
        light = "rose-pine-dawn-icons";
        package = pkgs.rose-pine-icon-theme;
      };
    };

    stylix-fonts.nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        nerd-fonts.im-writing
        atkinson-hyperlegible
        atkinson-hyperlegible-mono
        atkinson-hyperlegible-next
        noto-fonts-color-emoji
      ];

      stylix.fonts = {
        monospace.name = "iMWritingMono Nerd Font Propo";
        monospace.package = pkgs.nerd-fonts.im-writing;

        sansSerif.name = "Atkinson Hyperlegible";
        sansSerif.package = pkgs.atkinson-hyperlegible;

        serif.name = "iMWritingMono Nerd Font Propo";
        serif.package = pkgs.nerd-fonts.im-writing;

        emoji.name = "Noto Color Emoji";
        emoji.package = pkgs.noto-fonts-color-emoji;

        sizes = {
          applications = 10;
          desktop = 14;
          popups = 10;
          terminal = 10;
        };
      };
    };

    stylix-colours = {
      nixos = {
        stylix.base16Scheme = let
          olivia-pink = "f5bcad"; #f5bcad
          black = "171717"; #171717
          gray-1 = "272727"; #272727
          gray-2 = "333333"; #333333
          yellow = "ffcd7a"; #ffcd7a
          pink = "eb4f92"; #eb4f92
          purple = "c5a7e7"; #c5a7e7
          light-blue = "9fd4ff"; #9fd4ff
          teal-blue = "3a94b7"; #3a94b7
          # green = "#58b444";

          not-quite-white = "dccdca";
          # olivia-dark-1 = "5e4d47";
          # olivia-dark-2 = "9e786e"; #9e786e
          olivia-dark-2 = "8d685f"; #8d685f
        in {
          base00 = black; # #171717 default bg
          base01 = gray-1; #272727 alternate bg
          base02 = gray-2; #333333 selection bg
          base03 = olivia-dark-2; #9e786e
          base04 = "ffc3b0"; #ffc3b0 alternate text
          base05 = not-quite-white; #dccdca default text
          base06 = "b7b7b7"; #b7b7b7
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
      };

      home = {
        stylix.targets.yazi = {
          enable = true;
          colors.override = {
            base02 = "222222";
            base05 = "444444";
          };
        };
      };
    };
  };
}
