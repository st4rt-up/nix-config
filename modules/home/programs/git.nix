{...}: {
  programs.git = {
    enable = true;

    userName = "Kai R";
    userEmail = "stfourrtup@gmail.com";
  };

  home.shellAliases = {
    "ga" = "git add";
    "gc" = "git commit -m";
    
  };
}
