{
  modules = {
    alacritty.home.programs.alacritty = {
      enable = true;
      settings = {
        cursor = {
          style.shape = "Beam";
          style.blinking = "Always";
          blink_interval = 450;
        };
        # window = { decorations = "None"; };
      };
    };
  };
}
