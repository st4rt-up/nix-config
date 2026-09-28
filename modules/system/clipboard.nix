{inputs, ...}: {
  modules = {
    clipboard-wayland.nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [
        wl-clipboard
        cliphist
      ];
    };

    clipboard-nvf.nixos = {
      imports = [
        inputs.nvf.nixosModules.default
      ];

      programs.nvf.settings.vim = {
        clipboard = {
          enable = true;
          providers.wl-copy.enable = true;
        };
      };
    };
  };
}
