{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    yt-dlp
    imagemagick
    ffmpeg
    resvg
  ];
}
