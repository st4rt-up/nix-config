{...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    extraConfig = ''
      noremap! <Up> <Nop>
      noremap! <Down> <Nop>
      noremap! <Left> <Nop>
      noremap! <Right> <Nop>

      noremap! <Up> <Nop>
      noremap! <Down> <Nop>
      noremap! <Left> <Nop>
      noremap! <Right> <Nop>
    '';
  };
}
