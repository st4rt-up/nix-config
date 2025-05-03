{pkgs, ...}: {
  home.package = with pkgs; [
    godot_4_3
  ];
}
