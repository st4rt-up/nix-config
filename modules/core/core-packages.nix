{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # programming / dev
    ## nix
    alejandra # nix formatting
    nixd

    ## rust
    cargo
    rustc
    rustfmt
    rustlings

    # general utility
    fzf
    git
    ripgrep
    xorg.xrandr
    wget
    yt-dlp
    htop

    lf

    brightnessctl

    neofetch
    fastfetch

    # cli rice
    tty-clock
    figlet
    cava

    # for secrets management
    age
    ssh-to-age
    mkpasswd

    # nix
    home-manager
  ];
}
