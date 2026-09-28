{
  modules.kitty = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        kitty
      ];
    };

    home = {
      programs.kitty = {
        enable = true;
        settings = {
          # ==== CURSOR SETTINGS
          cursor_trail = 1;
          cursor_trail_decay = "0.05 0.1";
          # cursor = "#ffffff";
          # cursor_shape = "beam";

          font_size = 14;
          font_family = "iMWritingMono Nerd Font Propo";
        };
      };
    };
  };
}
