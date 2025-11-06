{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # programming / dev
    ## nix
    alejandra # nix formatting
    nixd
    comma
    clang
    home-manager

    # general utility
    fzf # fuzzy find
    git # you know what this is
    wget # files over https

    ripgrep # rust grep
    fd # rust find

    yazi # tui file browser

    # info and profiling
    xorg.xrandr # display info
    btop # task manager

    # terminal img view
    timg

    ## drive tools
    # smartmontools
    # e2fsprogs

    # libgpod # ipod tools
    # clementine
    # rhythmbox
  ];
}
