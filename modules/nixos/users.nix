{ pkgs, ... }: {

  programs.bash.enable = true;
  users.users.kai = {
    description = "kai";

    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager"] ;

    defaultUserShell = pkgs.bash;
  };

}