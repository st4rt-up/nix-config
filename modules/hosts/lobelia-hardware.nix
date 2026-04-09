{
  lib,
  inputs,
  ...
}: {
  modules.lobelia-hardware.nixos = {
    config,
    pkgs,
    modulesPath,
    ...
  }: {
    imports = [
      (modulesPath + "/installer/scan/not-detected.nix")
      inputs.nixos-hardware.nixosModules.framework-13-7040-amd
    ];

    programs.nh.flake = "/home/kai/files/dev-nix/nix-config/";
    networking.networkmanager.enable = true; # safeguard

    environment.systemPackages = with pkgs; [
      fw-fanctrl
    ];

    boot = {
      initrd.availableKernelModules = ["nvme" "xhci_pci" "thunderbolt"];
      initrd.kernelModules = [];
      kernelModules = ["kvm-amd"];
      extraModulePackages = [];
    };

    fileSystems."/" = {
      device = "/dev/disk/by-uuid/7f509aaa-cb79-47b1-b5f1-f4dbe82fe513";
      fsType = "ext4";
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-uuid/7C2A-1A08";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };

    swapDevices = [
      {device = "/dev/disk/by-uuid/e9c25c9c-8fc5-4552-8569-c6788dbd1a14";}
    ];

    system.stateVersion = "24.11";
    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
