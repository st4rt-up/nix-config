{ ... }: { 
  hardware.nvidia = {
    modesetting.enable = true;

    open = true;
    nvidiaSettings = true;

    prime = {
      nvidiaBusId = "PCI:1:0:0";
      amdgpuBusId = "PCI:4:0:0";

      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      sync.enable = false;
    };
  };
}