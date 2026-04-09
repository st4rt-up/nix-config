{
  pkgs,
  username,
  ...
}: {
  environment.systemPackages = with pkgs; [
    kdePackages.okular
  ];

  home-manager.users.${username} = {
    xdg.mimeApps = {
      enable = true;

      # set default for pdf
      defaultApplications = {"application/pdf" = "okularApplication_pdf.desktop";};
    };
  };
}
