# system level
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # stm32cubemx
    libreoffice
    quartus-prime-lite
    # too big for compter

    omnissa-horizon-client
  ];
}
