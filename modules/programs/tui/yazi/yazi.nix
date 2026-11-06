/*
{lib, ...}:
let
  # inherit (lib) importTOML;
in
*/
_: {
  modules.yazi = {
    nixos = {pkgs, ...}: {
      programs.yazi = {
        enable = true;
        plugins = {
          inherit
            (pkgs.yaziPlugins)
            mount
            smart-enter
            chmod
            convert
            gitui
            office
            restore
            ;
        };
        # settings.yazi = importTOML ./settings.toml;

        settings.keymap = {
          mgr.prepend_keymap = [
            {
              on = ["<Esc>"];
              run = "quit";
              desc = "close with Escape";
            }
            {
              on = ["<Enter>"];
              run = "plugin smart-enter";
              desc = "smart-enter";
            }
          ];
        };
      };
    };
    home = {
      programs.yazi = {
        enable = true;
      };
    };
  };
}
