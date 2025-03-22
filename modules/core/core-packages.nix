{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alejandra
    
    fzf
    git
    
    neofetch
    nixd

    ripgrep

    xorg.xrandr
  ];
}
