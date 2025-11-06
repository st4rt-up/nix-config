{
  username,
  pkgs,
  config,
  lib,
  inputs,
  ...
}: let
  inherit (lib) mkIf;

  outOfStore = config.home-manager.users.${username}.lib.file.mkOutOfStoreSymlink;
  configPath = config.var.flake-path + "/modules/programs/awww/dotfiles";
  niri-config = "awww-niri.kdl";
in {
  environment.systemPackages = [
    inputs.awww.packages.${pkgs.system}.awww
  ];

  home-manager.users.${username} = {
    xdg.configFile =
      mkIf config.programs.niri.enable
      {
        "niri/config.kdl".text = "include \"${niri-config}\"";
        "niri/${niri-config}".source = outOfStore configPath + "/${niri-config}";
      };
  };
}
