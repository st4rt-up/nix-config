{
  inputs,
  config,
  lib,
  pkgs,
  username,
  options,
  ...
}: let
  # configPath = config.var.flake-path + "/modules/programs/optnix/dotfiles";
  # outOfStore = config.home-manager.users.${username}.lib.file.mkOutOfStoreSymlink;
  optnixLib = inputs.optnix.mkLib pkgs;
in {
  imports = [inputs.optnix.nixosModules.optnix];
  environment.systemPackages = [inputs.optnix.packages.${pkgs.system}.optnix];

  programs.optnix = {
    enable = true;

    settings = {
      min_score = 3;
      default_scope = username;

      scopes.${username} = {
        description = "config for ${username}, system level";
        options-list-file = optnixLib.mkOptionsList {inherit options;};
      };
    };
  };

  home-manager.users.${username} = {
    imports = [inputs.optnix.homeModules.optnix];

    programs.optnix = {
      enable = true;

      settings.scopes.home-manager = {
        description = "config for ${username}, home level";
        options-list-file = optnixLib.hm.mkOptionsListFromHMSource {
          inherit (inputs) home-manager;
          modules = let
            ifInstalled = lib.lists.optionals;
            home = config.home-manager.users.${username}.programs;
          in
            [inputs.optnix.homeModules.optnix]
            ++ ifInstalled home.nixcord.enable [inputs.nixcord.homeModules.nixcord]
            ++ ifInstalled home.zen-browser.enable [inputs.zen-browser.homeModules.beta];
        };
        evaluator = "";
      };
    };
    # xdg.configFile."optnix/config.toml".source = outOfStore configPath + "/config.toml";
  };
}
