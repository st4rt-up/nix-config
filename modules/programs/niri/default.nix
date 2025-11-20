{
  username,
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  # ==== helper functions
  inherit (builtins) concatStringsSep;
  inherit (lib) mergeAttrsList mkForce ;

  link = config.home-manager.users.${username}.lib.file.mkOutOfStoreSymlink;
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

  # disable defaults
  services.gnome.gnome-keyring.enable = mkForce false;

  programs.niri.enable = true;
  environment.systemPackages = with pkgs; [
    # niri-unstable from flake is being used right now
    # niri 
    xwayland-satellite
  ];

  home-manager.users.${username} = {
    # ==== home level config
    # stops the home-manager modules from making its own config
    programs.niri.config = null;
    programs.niriswitcher.enable = true;

    xdg.configFile =
      mergeAttrsList (map (file: {"niri/${file}.kdl".source = link configPath + "/${file}.kdl";}) configFiles)
      // {
      # https://blog.daniel-beskin.com/2025-10-18-symlinking-home-manager

      # create a .config.kdl that imports them based off of <configFiles> list above
      "niri/config.kdl".text =
        concatStringsSep "\n"
        (map (file: "include \"${file}.kdl\"") configFiles);
      };
  };
}
