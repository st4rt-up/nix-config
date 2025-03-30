{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      # nerd fonts
      nerd-fonts.fira-code
      nerd-fonts.fira-mono
      nerd-fonts.im-writing
      nerd-fonts.blex-mono

      # sans serifs

      # serifs

      # other
      noto-fonts-emoji
    ];
  };
}
