{ pkgs, ... }: {
  fonts = {

    enableDefaultPackages = true;

    packages = with pkgs; [
      nerd-fonts.fira-code
      nerd-fonts.fira-mono
      nerd-fonts.im-writing
      nerd-fonts.blex-mono
    ];
    
  };
}