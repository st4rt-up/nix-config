{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    wiki-tui # wikipedia
  ];
}
