{ pkgs, ... }: {

  # programs.bash.enable = true;

  # sops.secrets.
  
  users.users.kai = {
    description = "kai";

    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager"] ;

    useDefaultShell = true;
  };

  users.defaultUserShell = pkgs.bash;

}