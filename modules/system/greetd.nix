{
  inputs,
  config,
  pkgs,
  ...
}: let
  tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
  session = "${pkgs.hyprland}/bin/Hyprland";
in {
  environment.systemPackages = with pkgs; [greetd.tuigreet];

  services.greetd = {
    enable = true;

    settings = {
      initial_session = {
        user = "${config.var.username}";
        command = "${session}"; # temp
      };
      default_session = {
        user = "greeter";
        command = "${tuigreet} --greeting 'nixos' --remember --remember-user-session --time --cmd ${session}";
      };
    };
  };

  # thanks https://github.com/sjcobb2022/nixos-config/blob/main/hosts/common/optional/greetd.nix
  # systemd.services.greetd.serviceConfig = {
  #  Type = "idle";
  #  StandardInput = "tty";
  #  StandardOutput = "tty";
  #  StandardError = "journal";

  #  TTYReset = true;
  #  TTYVHangup = true;
  #  TTVYDisallocate = true;
  #};
}
