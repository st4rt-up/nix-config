pkgs: {
  userSettings = {
    "[nix]" = {
      "editor.tabSize" = 2;
    };
  };

  extensions = with pkgs.vscode-extensions; [
    jnoortheen.nix-ide
  ];
}
