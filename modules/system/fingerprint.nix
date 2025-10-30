{pkgs, ...}: {
  # environment.systemPackages = with pkgs; [
  # libfprint-2-tod1-vfs0090
  # nss
  # ];

  systemd.services.fprintd = {
    wantedBy = ["multi-user.target"];
    serviceConfig.Type = "simple";
  };

  services.fprintd = {
    enable = true;

    # tod = {
    #   enable = true;
    #   driver = pkgs.libfprint-2-tod1-vfs0090;
    # };
  };
}
