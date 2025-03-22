{ ... }: {
  imports = [
    inputs.nixcord.homeManagerModules.nixcord
  ];

  programs.nixcord = {
    enable = true;
    
    config = {
      plugins = {
      
        # new features
        betterGifPicker.enable = true;
        nsfwGateBypass.enable = true;
        emoteCloner.enable = true;
        fakeNitro.enable = true;
        favoriteEmojiFirst.enable = true;
        favoriteGifSearch.enable = true;
        messageLogger.enable = true;
        silentTyping = {
          enable = true;
          showIcon = true;
        };
        spotifyControls = {
          enable = true;
          hoverControls = true;
        };
        spotifyCrack = {
          enable = true;
          noSpotifyAutoPause = true;
        };
        spotifyShareCommands.enable = true;
        vencordToolbox.enable = true;
        voiceDownload.enable = true;
        voiceMessages.enable = true;
        volumeBooster.enable = true;
        
        # fix annoyances
        alwaysTrust.enable = true;
        clearURLs.enable = true;
        dearrow = {
          enable = true;
          hideButton = true;
        };
        noPendingCount.enable = true;
        normalizeMessageLinks.enable = true;
        dontRoundMyTimestamps.enable = true;
        fixYoutubeEmbeds.enable = true;
        noF1.enable = true;
        voiceChatDoubleClick.enable = true;
        youtubeAdblock.enable = true;
        

        # ui
        accountPanelServerProfile.enable = true;
        blurNSFW.enable = true;
        callTimer.enable = true;
        forceOwnerCrown.enable = true;
        friendsSince.enable = true;
        memberCount.enable = true;
        noUnblockToJump.enable = true;
        platformIndicators.enable = true;
        relationshipNotifier.enable = true;
        replyTimestamp.enable = true;
        sendTimestamps.enable = true;
        serverInfo.enable = true;
        serverListIndicators.enable = true;
        shikiCodeblocks.enable = true;
        showConnections.enable = true;
        themeAttributes.enable = true;
        typingIndicator.enable = true;
        typingTweaks.enable = true;
        userVoiceShow.enable = true;
        whoReacted.enable = true;

        # input qol
        betterFolders = {
          enable = true;

          closeAllFolders = true;
          closeAllHomeButton = true;
          closeOthers = true;
          forceOpen = true;
        };
        betterSettings = {
          enable = true;
          disableFade = true;
          organizeMenu = true;
          eagerLoad = true;
        };
        gameActivityToggle.enable = true;
        messageClickActions.enable = true;
        quickReply.enable = true;
        readAllNotificationsButton.enable = true;
        revealAllSpoilers.enable = true;

        # fixes
        crashHandler = {
          enable = true;
          attemptToPreventCrashes = true;
        };
        validUser.enable = true;
        webScreenShareFixes.enable = true;

        # fun
        moreKaomoji.enable = true;
        moyai.enable = true;
      };
    };

    # discord.settings = {};
  };
}