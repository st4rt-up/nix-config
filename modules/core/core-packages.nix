{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # programming / dev
    ## nix
    alejandra # nix formatting
    nixd
    comma

    # general utility
    fzf # fuzzy find
    git

    ripgrep # rust grep

    xorg.xrandr # display info
    wget # files over https
    htop # task manager

    networkmanagerapplet

    alsa-utils # audio tools

    ## drive tools
    # smartmontools
    # e2fsprogs

    rquickshare

    # file management
    yazi # file browser

    # terminal img view
    timg

    # definitely extras
    # wiki-tui # wikipedia
    # ncspot # spotify

    # libgpod # ipod tools
    # clementine
    # rhythmbox

    # neofetch
    fastfetch

    # yt-dlp

    # cli rice
    # tty-clock
    # figlet
    # cava

    # for secrets management
    age
    ssh-to-age
    mkpasswd

    # nix
    home-manager
  ];
}
