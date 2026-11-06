{
  modules.obsidian = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        obsidian
      ];
    };

    home = {
      xdg.desktopEntries.obsidian = {
        name = "Obsidian";
        exec = "obsidian %u";
        icon = "obsidian";

        mimeType = ["x-scheme-handler/obsidian"];
        categories = ["Office"];
        terminal = false;

        settings = {
          StartupWMClass = "md.obsidian.Obsidian";
        };

        comment = "Knowledge base";
      };
    };
  };
}
