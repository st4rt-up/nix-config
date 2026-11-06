{
  modules.wayland.nixos = {pkgs, ...}: {
    nixpkgs.overlays = [
      (final: prev: {
        xdg-desktop-portal-wlr = prev.xdg-desktop-portal-wlr.overrideAttrs (oldAttrs: {
          version = "0.8.2";
          src = oldAttrs.src.override {
            rev = "v0.8.2";
            sha256 = "sha256-HITf/hgiASWvn/z49mzS8IS1vuyXwdk1JiAOOHRSQMo=";
          };
        });
      })
    ];

    environment.systemPackages = with pkgs; [
      brightnessctl
      wayland
      wlr-randr
      wlay
    ];

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
      ];
    };

    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
      MOZ_USE_WAYLAND = "1";
    };
  };
}
