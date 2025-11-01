{
  username,
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  # ==== helper functions
  inherit (builtins) listToAttrs concatStringsSep;
  inherit (lib) mergeAttrs mkForce;
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
  # ==== this block is for niri-unstable from the github flake
  imports = [inputs.niri.nixosModules.niri];
  nixpkgs.overlays = [inputs.niri.overlays.niri];
  programs.niri.package = pkgs.niri-unstable;
  # ====

  # disable some defaults
  services.gnome.gnome-keyring.enable = mkForce false;

  programs.niri.enable = true;
  environment.systemPackages = with pkgs; [niri];

  home-manager.users.${username} = {
    # ==== home level config
    # stops the home-manager modules from making its own config
    programs.niri.config = null;
    programs.niriswitcher.enable = true;

    # i feel like this is a little hacky?
    # symlink config files in ./<configPath>
    # this pattern lets me hot reload files outside of the nix store
    xdg.configFile =
      (mergeAttrs (listToAttrs (map (file: {
          name = "niri/${file}.kdl";
          value = {source = outOfStore configPath + "/${file}.kdl";};
        })
        configFiles)))
      {
        # create a .config.kdl that imports them based off of <configFiles> list above
        "niri/config.kdl" = {
          # target = "niri/config.kdl";
          text = concatStringsSep "\n" (map (file: "include \"${file}.kdl\"") configFiles);
        };
      };
  };
}
