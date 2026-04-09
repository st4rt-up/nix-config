{
  username,
  pkgs,
  ...
}: {
  services.udisks2.enable = true;

  home-manager.users.${username} = {
    services.udiskie = {
      enable = true;
      settings = {
        program_options = {
          file_manager = "${pkgs.yazi}";
        };
      };
    };
  };
}
