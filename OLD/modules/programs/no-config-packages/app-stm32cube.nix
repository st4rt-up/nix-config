{pkgs, ...}: {
  environment.systemPackages = with pkgs; [stm32cubemx];
}
