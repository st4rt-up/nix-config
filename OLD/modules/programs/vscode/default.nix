{
  username,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [vscode];
  home-manager.users.${username} = {
    programs.vscode = {
      enable = true;
      profiles.default =
        import ./vscode-nix.nix pkgs
        // {
          enableUpdateCheck = false;
          userSettings = {
            #"files.autoSave" = "off";
            "workbench.startupEditor" = "none";
          };
          extensions = with pkgs.vscode-extensions; [
            mkhl.direnv
            arrterian.nix-env-selector
          ];
        };
    };
  };
}
