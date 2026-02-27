{
  inputs,
  username,
  config,
  lib,
  ...
}: let
  inherit (config) theme;
  inherit (lib) mkDefault mkIf;
in {
  imports = [inputs.stylix.nixosModules.stylix];
  stylix = mkIf theme.enableStylix {
    enable = true;
    inherit (theme) polarity;
    base16Scheme = {
      inherit (theme.colour) base01 base00 base02 base03 base04 base05 base06 base07 base08 base09 base0A base0B base0C base0D base0E base0F;
    };

    fonts = mkDefault {
      inherit (theme.fonts) monospace sansSerif serif emoji;
      sizes = {
        inherit (theme.fonts.sizes) applications desktop popups terminal;
      };
    };
  };

  home-manager.users.${username} = mkIf theme.enableStylix {
    stylix = {
      targets = {
        qt.enable = true;
        kde.enable = true;
        gtk.enable = false;

        rofi.enable = false;
        mako.enable = false;
        yazi.enable = false;
        tmux.enable = false;
        obsidian.enable = false;

        nixcord.enable = false;
        vencord.enable = false;
        vesktop.enable = false;

        zen-browser = {
          enable = true;
          profileNames = ["default"];
        };
      };
    };
  };
}
