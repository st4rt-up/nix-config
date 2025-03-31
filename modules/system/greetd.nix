{config, ...}: {
  services.greetd = {
    enable = true;

    settings = {
      initial_session = {
        user = "${config.var.username}";
        command = "Hyprland"; # temp
      };
    };
  };
}
