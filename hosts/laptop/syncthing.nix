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

    settings = {
      # gui = {
      #   user = "${config.var.username}";
      #   password = #implement later;
      # };

      devices = {
        "pixel-7-phone".id = inputs.nix-secrets.syncthing.devices.pixel-7-phone.id;
        "samsung-s6-tablet".id = inputs.nix-secrets.syncthing.devices.samsung-s6-tablet.id;
        "pc".id = inputs.nix-secrets.syncthing.devices.pc.id;
      };

      folders = {
        #   "notes" = {};
        "school" = {
          id = inputs.nix-secrets.syncthing.folders.school.id;
          path = "${files}/school";
          devices = [
            "pixel-7-phone"
            "samsung-s6-tablet"
            "pc"
          ];
          ignorePerms = false;
        };
      };
    };
  };
}
