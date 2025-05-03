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
    fzf # fuzzy find
    git
    ripgrep # rust grep

    xorg.xrandr # display info
    wget
    htop

    alsa-utils # audio tools

    ## drive tools
    smartmontools
    e2fsprogs

    lf # file browser
    #libgpod # ipod tools
    #clementine
    rhythmbox

    brightnessctl

    neofetch
    fastfetch

    yt-dlp

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
