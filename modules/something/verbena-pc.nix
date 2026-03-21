{
  config,
  lib,
  ...
}: {
  configurations.nixos.verbena = {
    time.timeZone = "America/Toronto";
  };
}
