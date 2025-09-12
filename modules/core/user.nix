{
  config,
  pkgs,
  ...
}: {
  sops.secrets."keys/ssh/github-ssh" = {};

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
