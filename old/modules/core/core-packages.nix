{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # programming / dev
    alejandra # nix formatting
    nixd

    # general utility
    fzf
    git
    ripgrep
    xorg.xrandr
    wget

    neofetch

    # for secrets management
    age
    ssh-to-age
    mkpasswd

    # nix
    home-manager
  ];
}
