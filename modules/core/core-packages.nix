{pkgs, ...}: {
  imports = [
    ./nix
    

  ];

  environment.systemPackages = with pkgs; [
    alejandra
    
    fzf
    git
    
    neofetch
    nixd

    ripgrep
  ];
}
