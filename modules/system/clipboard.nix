{inputs, ...}: {
  modules = {
    clipboard-wayland = {
      nixos = {pkgs, ...}: {
        environment.systemPackages = with pkgs; [
          wl-clipboard
          cliphist
        ];
      };

      home = {
        services.cliphist = {
          enable = true;

          systemdTargets = ["config.wayland.systemd.target"];

          allowImages = true;
          extraOptions = [
            "-max-dedupe-search"
            "10"
            "-max-items"
            "500"
          ];
        };
      };
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
