{
  inputs,
  config,
  pkgs,
  ...
}: let
  files = config.var.files-directory;
in {
  environment.systemPackages = [pkgs.syncthing];

  services.syncthing = {
    enable = true;
    openDefaultPorts = true;

    user = "${config.var.username}";
    overrideDevices = true;
    overrideFolders = true;

    group = "users";
    # extraFlags = ["--no-default-folder"];

    dataDir = "${files}/share/syncthing";
    configDir = "/home/${config.var.username}/.config/syncthing";

    key = "/run/${config.var.username}/syncthing-laptop/key.pem";
    cert = "/run/${config.var.username}/syncthing-laptop/cert.pem";

    settings = {
      # gui = {
      #   user = "${config.var.username}";
      #   password = #implement later;
      # };

      devices = {
        "phone".id = inputs.nix-secrets.syncthing.phone-id;
      };

      folders = {
        #   "notes" = {};
        "school" = {
          path = "${files}/school";
          devices = ["phone"];
          ignorePerms = false;
        };
      };
    };
  };
}
