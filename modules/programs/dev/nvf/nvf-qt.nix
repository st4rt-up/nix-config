{
  modules.nvf-qt = {
    nixos = {
      programs.nvf.settings.vim = {
        lsp.servers.qmlls = {
          cmd = ["qmlls"];
          filetypes = ["qt" "qml"];
        };
      };
    };
  };
}
