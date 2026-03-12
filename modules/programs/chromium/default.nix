{
  # username,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    chromium
  ];

  programs.chromium = {
    enable = true;
    homepageLocation = "https://duckduckgo.com";
  };
}
