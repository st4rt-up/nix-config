{
  config,
  pkgs,
  ...
}: {
  users = {
    defaultUserShell = pkgs.bash;
    users."${config.var.username}" = {
      description = "${config.var.username}";

      isNormalUser = true;
      extraGroups = ["wheel" "networkmanager"];
      useDefaultShell = true;
    };
  };
}
