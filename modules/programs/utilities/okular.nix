{
  modules.okular = {
    nixos = {pkgs, ...}: {
      environment.systemPackages = with pkgs; [kdePackages.okular];
    };

    home = {
      xdg.mimeApps = {
        enable = true;
        defaultApplications = {"application/pdf" = "okularApplication_pdf.desktop";};
      };
    };
  };
}
