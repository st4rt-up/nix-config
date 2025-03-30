{pkgs, ...}: {
  home.packages = with pkgs; [hyprlock];
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
        no_fade_in = true;
        no_fade_out = true;
      };
    };
  };
}
