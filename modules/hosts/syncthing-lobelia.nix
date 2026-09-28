{
  inputs,
  config,
  # lib,
  ...
}: {
  modules.syncthing-lobelia.nixos = _: let
    username = "kai";
    files = "/home/${username}/files";
    syncthing-key-path = "/run/syncthing-laptop";
  in {
    imports = [
      inputs.sops-nix.nixosModules.sops
      config.modules.syncthing-base.nixos
    ];

    sops.secrets."secrets/syncthing/laptop/key".path = "${syncthing-key-path}/key.pem";
    sops.secrets."secrets/syncthing/laptop/cert".path = "${syncthing-key-path}/cert.pem";

    services.syncthing = {
      key = "${syncthing-key-path}/key.pem";
      cert = "${syncthing-key-path}/cert.pem";
      user = username;

      group = "users";
      # extraFlags = ["--no-default-folder"];

      dataDir = "${files}/share/syncthing";
      configDir = "/home/${username}/.config/syncthing";

      settings = {
        # gui = {
        #   user = "${username}";
        #   password = #implement later;
        # };

        devices = {
          "pixel-7-phone".id = inputs.nix-secrets.syncthing.devices.pixel-7-phone.id;
          "pc".id = inputs.nix-secrets.syncthing.devices.pc.id;
        };

        folders = {
          "school" = {
            inherit (inputs.nix-secrets.syncthing.folders.school) id;
            path = "${files}/school";
            devices = [
              "pixel-7-phone"
              "pc"
            ];
            ignorePerms = false;
          };

          "notes" = {
            inherit (inputs.nix-secrets.syncthing.folders.notes) id;
            path = "${files}/notes";
            devices = [
              "pixel-7-phone"
              "pc"
            ];
          };

          "share" = {
            inherit (inputs.nix-secrets.syncthing.folders.share) id;
            path = "${files}/share";
            devices = [
              "pixel-7-phone"
              "pc"
            ];
          };
        };
      };
    };
  };
}
