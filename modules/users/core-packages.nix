{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alejandra
    nixd
    comma

    xorg.xrandr
    htop

    fzf
    ripgrep

    yazi
    git

    fastfetch
    timg

    yt-dlp
    ffmpeg

    age
    ssh-to-age
    mkpasswd
  ];
}
