{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # ==== secrets management
    age # encryption scheme
    ssh-to-age
    mkpasswd
  ];
}
