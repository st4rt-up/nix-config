{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alejandra

    fzf
    git

    neofetch
    nixd

    ripgrep

    age
    ssh-to-age
    mkpasswd
    xorg.xrandr
  ];
}
