{...}: {
  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mainMod, left,  movefocus, l"
      "$mainMod, right, movefocus, r"
      "$mainMod, up,    movefocus, u"
      "$mainMod, down,  movefocus, d"

      "$mainMod, h, movefocus, l"
      "$mainMod, j, movefocus, d"
      "$mainMod, k, movefocus, u"
      "$mainMod, l, movefocus, r"

      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
      "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
      "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
      "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
      "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
      "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
      "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
      "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
      "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
      "$mainMod SHIFT, 0, movetoworkspacesilent, 10"
      "$mainMod CTRL, c, movetoworkspace, empty"

      "$mainMod CTRL, left, workspace, -1"
      "$mainMod CTRL, right, workspace, +1"

      "$mainMod, TAB, workspace, +1"

      "$mainMod SHIFT, left, movewindow, l"
      "$mainMod SHIFT, right, movewindow, r"
      "$mainMod SHIFT, up, movewindow, u"
      "$mainMod SHIFT, down, movewindow, d"

      "$mainMod SHIFT, h, movewindow, l"
      "$mainMod SHIFT, j, movewindow, d"
      "$mainMod SHIFT, k, movewindow, u"
      "$mainMod SHIFT, l, movewindow, r"

      "$mainMod SHIFT, r, exec, $terminal"
      "$mainMod ALT, q, exit"
      "$mainMod, q, killactive"
      "$mainMod, v, togglefloating"
    ];

    binde = [
      "$mainMod ALT, left, resizeactive, -10 0"
      "$mainMod ALT, down, resizeactive, 0 10"
      "$mainMod ALT, up, resizeactive, 0 -10"
      "$mainMod ALT, right, resizeactive, 10 0"

      "$mainMod ALT, h, resizeactive, -10 0"
      "$mainMod ALT, j, resizeactive, 0 10"
      "$mainMod ALT, k, resizeactive, 0 -10"
      "$mainMod ALT, l, resizeactive, 10 0"
    ];

    #    binde = [
    #      "CTRL, ALT, left, resizeactive, -10 0"
    #      "CTRL, ALT, h, resizeactive, -10 0"
    #
    #      "CTRL, ALT, right, resizeactive, 10 0"
    #      "CTRL, ALT, l, resizeactive, 10 0"
    #
    #      "CTRL, ALT, up, resizeactive, 0 10"
    #      "CTRL, ALT, k, resizeactive, 0 10"
    #
    #      "CTRL, ALT, down, resizeactive, 0 -10"
    #      "CTRL, ALT, j, resizeactive, 0 -10"
    #    ];

    #    submaps = {
    #      resize.settings = {
    #
    #        bind = k
    #          " , enter, submap, reset"
    #          " , escape, submap, reset"
    #
    #          " , Return, submap, reset"
    #        ];
    #      };
    #    };

    # mouse binding
    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
  };
}
