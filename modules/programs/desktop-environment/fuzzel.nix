{
  modules = {
    fuzzel.home = {
      programs.fuzzel = {
        enable = true;
        settings = {
          main = {
            anchor = "top-right";

            vertical-pad = 20;
            horizontal-pad = 40;
            inner-pad = 20;
            x-margin = 30;
            y-margin = 30;
            lines = 25;

            placeholder = "search...";
            message = "applications";

            filter-desktop = true;
          };

          border = {
            width = 1;
            radius = 0;
          };
        };
      };
    };

    stylix-fuzzel.home =
      #  { config, ... }:
      _: {
        stylix.targets.fuzzel = {
          fonts.override = {
            # sansSerif = config.stylix.fonts.monospace;
            sansSerif.name = "iMWritingDuo Nerd Font";
            sizes.popups = 12;
          };

          colors.override = {
            base0D-hex = "#ef2aa0";
          };
        };
      };
  };
}
