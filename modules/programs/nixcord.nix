{inputs, ...}: {
  modules.nixcord.home = {pkgs, ...}: {
    imports = [inputs.nixcord.homeModules.nixcord];

    programs.nixcord = {
      enable = true;
      discord = {
        package = pkgs.discord;
        vencord.enable = false;
        equicord.enable = true;
      };

      config = {
        # transparent = true;
        plugins = {
          accountPanelServerProfile.enable = true;
          betterGifAltText.enable = true;
          betterRoleContext.enable = true;
          betterRoleDot.enable = true;
          dontRoundMyTimestamps.enable = true;

          fakeNitro.enable = true;

          # favoriteGifSearch.enable = true;
          fixCodeblockGap.enable = true;
          fixImagesQuality.enable = true;
          memberCount.enable = true;

          noF1.enable = true;

          betterSettings.enable = true;
          betterUploadButton.enable = true;
          quickReply.enable = true;
          quickMention.enable = true;

          spotifyCrack.enable = true;
          stickerPaste.enable = true;
          userVoiceShow.enable = true;
          validReply.enable = true;
          validUser.enable = true;
          viewRaw.enable = true;
          voiceChatDoubleClick.enable = true;

          voiceDownload.enable = true;
          voiceMessages.enable = true;
          volumeBooster.enable = true;

          clearUrls.enable = true;

          dearrow.enable = true;
          fixYoutubeEmbeds.enable = true;
          youtubeAdblock.enable = true;
        };
      };

      /*
      vencordConfig.plugins = {
        betterGifPicker.enable = true;
        BlurNSFW.enable = true;
        favoriteEmojiFirst.enable = true;
        spotifyControls.enable = true;
      };
      */

      equicordConfig.plugins = {
        betterForwards.enable = true;
        gifCollections.enable = true;
        googleThat.enable = true;
        homeTyping.enable = true;
        jumpscare.enable = true;
        keyboardNavigation.enable = true;
        noNitroUpsell.enable = true;
        quoter = {
          enable = true;
          saveAsGif = true;
        };
        screenRecorder.enable = true;
        voiceButtons.enable = true;
        zipPreview.enable = true;
      };
    };
  };
}
