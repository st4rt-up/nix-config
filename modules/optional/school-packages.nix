# system level
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    stm32cubemx

    quartus-prime-lite
  ];
}
