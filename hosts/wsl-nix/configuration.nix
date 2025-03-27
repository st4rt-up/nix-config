{ inputs, pkgs, ... }: {

  programs.nix-ld.enable = true;
  programs.ssh.startAgent = true;

  environment.systemPackages = with pkgs; [
    wget
  ];
  
  }