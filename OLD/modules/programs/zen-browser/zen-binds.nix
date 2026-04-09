{
  keyboardShortcutsVersion = 16;
  keyboardShortcuts = let
    mkBind = key: id: {
      control ? false,
      alt ? false,
      shift ? false,
    }: {
      inherit key id;
      modifiers = {inherit control shift alt;};
    };

    unbind = id: {
      inherit id;
      disabled = true;
    };
  in
    [
      (mkBind "t" "key_newNavigatorTab" {control = true;})
      (mkBind "q" "key_close" {control = true;})
      (mkBind "k" "focusURLBar" {control = true;})
      (mkBind "a" "key_openAddons" {shift = true;})
      (mkBind "m" "key_toggleMute" {control = true;})

      (mkBind "c" "zen-compact-mode-toggle" {
        control = true;
        alt = true;
      })
      (mkBind "s" "zen-compact-mode-show-sidebar" {
        control = true;
        alt = true;
      })
    ]
    ++ map unbind [
      "key_newNavigator"
      "key_closeWindow"
      "key_quitApplication"
      "viewBookmarksToolbarKb"
      "viewBookmarksSidebarKb"
      "bookmarkAllTabsKb"
      "key_search"
      "key_search2"
      "focusURLBar2"
      "key_openDownloads"

      "key_switchTextDirection"
      "key_togglePictureInPicture"
      "key_switchTextDirection"
      "key_toggleReaderMode"
      "viewGenaiChatSidebarKb"

      "zen-split-view-grid"
      "zen-split-view-vertical"
      "zen-split-view-horizontal"
      "zen-split-view-unsplit"
      "zen-pinned-tab-reset-shortcut"
      "zen-copy-url"
      "zen-copy-url-markdown"
      "key_accessibility"
      "key_dom"
      "key_storage"
      "key_performance"
      "key_styleeditor"
      "key_netmonitor"
      "key_jsdebugger"
      "key_webconsole"
      "key_responsiveDesignMode"
      "key_inspector"
    ];
}
