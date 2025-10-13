{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # ==== video + image processing
    yt-dlp
    ffmpeg

    # ==== cli rice
    fastfetch # fetch
    tty-clock # clock,,
    figlet # turn text into ascii art
    cava # neat little animation

    # ==== secrets management
    age # encryption scheme
    ssh-to-age
    mkpasswd

    # ==== browser apps in tui
    wiki-tui # wikipedia
    # ncspot # spotify
  ];
}
