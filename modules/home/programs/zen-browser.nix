{
  inputs,
  system,
  var,
  pkgs,
  ...
}: {
  home.packages = [
    inputs.zen-browser.packages."${system}".default
  ];
}
