{
  inputs,
  lib,
  pkgs,
  username,
  ...
}: {
  environment.sessionVariables = {MOZ_USE_XINPUT2 = "1";};

  home-manager.users.${username} = {
    imports = [
      inputs.zen-browser.homeModules.beta
    ];

    programs.zen-browser = {
      enable = true;
      nativeMessagingHosts = [pkgs.keepassxc];
      profiles = {
        default = {
          id = 0;
          name = "default";
          isDefault = true;

          search = {
            force = true;
            default = "ddg";
            privateDefault = "ddg";
          };

          inherit
            (import ./firefox-extensions.nix {
              inherit lib pkgs inputs;
            })
            extensions
            ;

          inherit (import ./zen-mods.nix) mods;
          inherit (import ./zen-binds.nix) keyboardShortcutsVersion keyboardShortcuts;

          # hack to get unfree extensions
        };
      };

      inherit (import ./firefox-policies.nix) policies;
    };
  };
}
