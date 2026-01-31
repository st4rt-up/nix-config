# system level
{
  pkgs,
  lib,
  ...
}: let
  inherit (builtins) elem;
  inherit (lib) getName;
in {
  /*
  nixpkgs.config.allowUnfreePredicate = pkg:
    elem (getName pkg) [
      "zoom-us"
    ];
  */

  environment.systemPackages = with pkgs; [
    stm32cubemx

    libreoffice
    quartus-prime-lite
    # zoom-us

    # omnissa-horizon-client
  ];
}
