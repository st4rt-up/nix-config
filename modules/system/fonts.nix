{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      #
      dejavu_fonts

      # nerd fonts
      nerd-fonts.fira-code
      nerd-fonts.fira-mono
      nerd-fonts.im-writing
      nerd-fonts.blex-mono

      # sans serifs
      atkinson-hyperlegible
      atkinson-hyperlegible-next
      atkinson-hyperlegible-mono

      manrope
      # serifs
      lora

      # other
      noto-fonts-emoji

      #jp
      ipafont
      kochi-substitute
    ];

    fontconfig = {
      enable = true;

      defaultFonts = {
        monospace = [
          "FiraCode Nerd Font"
          "IPAGothic"
        ];

        sansSerif = [
          "FiraCode Nerd Font"
          "IPAGothic"
        ];

        serif = [
          "Lora"
          "IPAPMincho"
        ];
      };
    };
  };
}
