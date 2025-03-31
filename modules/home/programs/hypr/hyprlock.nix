{pkgs, ...}: {
  home.packages = with pkgs; [hyprlock];

  wayland.windowManager.hyprland.settings = {
    exec-once = ["hyprlock"];
  };
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        disable_loading_bar = "true";
        hide_cursor = "true";

        immediate_render = "true";
        # no_fade_in = "true";
        # no_fade_out = "true";

        ignore_empty_input = "true";
      };

      auth = {
        "pam:enabled" = "true";
      };

      animations = {
        enabled = true;
        animation = [
          "fade, 1, 0.01, linear"
        ];
      };
    };
  };
}
