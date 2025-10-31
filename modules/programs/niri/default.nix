{
  username,
  config,
  lib,
  pkgs,
  ...
}: let
  # ==== helper functions
  inherit (builtins) listToAttrs concatStringsSep;
  inherit (lib) mergeAttrs;
  outOfStore = config.home-manager.users.${username}.lib.file.mkOutOfStoreSymlink;
  configPath = config.var.flake-path + "/modules/programs/niri/dotfiles";

  # config file in .config is dynamically created and then files in this directory are
  # symlinked and mutable and can be hot reloaded
  configFiles = [
    "default"

    "binds"
    "input"
    # "output"

    "laptop"
  ];
in {
  environment.systemPackages = with pkgs; [
    niri
  ];

  # disable some defaults
  services.gnome = {
    gnome-keyring.enable = false;
  };

  programs.niri.enable = true;

  home-manager.users.${username} = {
    # ==== home level config
    xdg.configFile =
      # i feel like this is a little hacky?
      # symlink config files in ./<configPath>
      # this pattern lets me hot reload files outside of the nix store
      (mergeAttrs (listToAttrs (map (file: {
          name = "niri/${file}.kdl";
          value = {source = outOfStore configPath + "/${file}.kdl";};
        })
        configFiles)))
      {
        # create a .config.kdl that imports them based off of <configFiles> list above
        "niri/config.kdl".text = concatStringsSep "\n" (map (file: "${file}.kdl") configFiles);
      };

    programs.niriswitcher.enable = true;
  };
}
