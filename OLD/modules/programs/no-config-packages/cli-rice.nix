{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    tty-clock # clock,,
    figlet # turn text into ascii art
    cava # neat little animation
  ];
}
