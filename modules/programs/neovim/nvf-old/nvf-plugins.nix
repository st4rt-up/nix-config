{username, ...}: {
  home-manager.users.${username} = {
    programs.nvf.settings.vim = {
      # dashboard.alpha = { # overrides some important binds
      # enable = true; # greeter
      # };

      # utility = {
      # motion.flash-nvim.enable = true; # turbo find / jump
      # surround.enable = true; # surround vim motions with brackets etc
      # };

      binds.whichKey.enable = true;

      debugger.nvim-dap = {
        enable = true;
        ui.enable = true;
        ui.autoStart = true;
      };
    };
  };
}
