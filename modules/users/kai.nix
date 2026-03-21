{inputs, ...}: let
  username = "kai";

  programs = [
    "bash" # terminal
    "neovim" # editor
    "tmux" # juiced terminal
    "direnv" # venv for directories

    "zoxide" # cd replacment
    "eza" # ls replacement
    "fzf" # fuzzy find
    "yazi" # cli file manager

    "git" # version control
    "fastfetch"
    "usb"

    "optnix"
    "minecraft"
  ];
  guiPrograms = [
    "nixcord" # declarative vencord
    "zen-browser" # firefox fork

    "obsidian" # markdown note taking
    "okular" # pdf reader
    "thunar" # file manager

    "kitty" # terminal emulator
    "keepassxc" # password manager
    "signal" # messenger

    "chromium" # other web browser for debug
  ];
  miscPkg = [
    "app-calc"
    "app-gimp"
    "app-libreoffice"
    "cli-rice"
    "tools-imgvid"
    "tools-pdf"
    "tools-disk"
  ];
  niriDE = [
    "wayland"
    "wayland-utils"

    "niri"
    "swayosd" # volume and brightness display
    "swayidle" # idle daemon

    "rofi" # application launcher
    "rofi-power-menu"
    "mako"

    "awww" # wallpaper manager
    "waybar" # status bar
  ];
  # testing = [ ];
  secrets = [
    "users/kai/github"
    # "users/kai/keepass" # commented out because keyfile is not stored on machine
  ];

  # miscPackages = with pkgs; [];

  inherit (builtins) concatMap;
in {
  # took this pattern, makes it easier to put non-home or system programs in one place
  # https://github.com/minusfive/dot/blob/main/nix/users/minusfive/aarch64-darwin.nix

  # instead of importing with relative paths, I make the relative paths with a list and map
  # the seperated lists just let me visually group packages together and I can turn off whole
  # groups at once during testing

  imports =
    concatMap (map (program: ../programs/${program})) [
      programs
      guiPrograms
      niriDE
      # testing
    ]
    ++ map (secret: ../secrets/${secret}.nix) secrets
    ++ map (p: ../programs/no-config-packages/${p}.nix) miscPkg
    ++ [
      {
        # messy but it lets me do user specific config
        _module.args = {inherit username;};
      }
      inputs.home-manager.nixosModules.home-manager
    ];

  config = {
    # inherit username;
    users.users.${username} = {
      name = username;
      description = username;

      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
        "audio"
      ];
    };

    # options defined by me
    # defined in core/options-host.nix
    var.path = {
      files = "/home/${username}/files";
      config = "/home/${username}/files/dev-nix/nix-config";
    };

    home-manager = {
      users.${username} = {
        home.username = username;
        home.stateVersion = "24.11";
        programs.home-manager.enable = true;
      };

      useUserPackages = true;
      useGlobalPkgs = true;
      backupFileExtension = "hmbackup";
    };
  };
}
