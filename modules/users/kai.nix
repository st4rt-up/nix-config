{inputs, ...}: let
  username = "kai";

  programs = [
    "bash" # terminal
    "shell-aliases"
    "neovim" # editor
    "tmux" # juiced terminal
    "direnv" # venv for directories

    "zoxide" # cd replacment
    "eza" # ls replacement
    "fzf" # fuzzy find
    "yazi" # cli file manager

    "git" # version control
    "extras-cli" # misc extras
    "usb"

    "optnix"
  ];

  guiPrograms = [
    "nixcord" # declarative vencord
    "zen-browser" # firefox fork

    "obsidian" # markdown note taking
    "okular" # pdf reader

    "kitty" # terminal emulator
    "gtk"
  ];

  schoolPrograms = [
    "school-packages"
    "pdf-utilities"
  ];
  niriDE = [
    "wayland"
    "wayland-utils"

    "niri"
    "swayosd"
    "swayidle"

    "rofi" # application launcher
    "mako"

    "awww"
    "waybar"
  ];
  testing = [
    "jj" # version control
    "wbg"
    "atuin" # command history (ctrl + r)
    "keepassxc"
  ];
  hyprDE = [
    "wayland"
    "wayland-utils" # grim + hyprland binds ()
    "swayosd" # brightness and volume for wayland

    "wofi" # application launcher
    "mako" # notification daemon

    "hyprland" # compositor / window server
    "hyprpaper"
    "hypridle"
    "hyprlock"

    "waybar" # bar
  ];

  secrets = [
    "users/kai/github"
    # "users/kai/keepass"
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
      schoolPrograms
      # hyprDE
      niriDE
      testing
    ]
    ++ map (secret: ../secrets/${secret}.nix) secrets
    ++ [
      {
        # messy but it lets me do user specific config
        _module.args = {inherit username;};

        # environment.systemPackages = miscPackages;
      }
      inputs.home-manager.nixosModules.home-manager
    ];

  config = {
    # inherit username;
    users.users.${username} = {
      name = username;
      description = username;

      isNormalUser = true;
      # useDefaultShell = true;
      extraGroups = [
        "wheel"
        "networkmanager"
        "audio"
      ];
    };

    # options defined by me
    # defined in core/options-host.nix
    var = {
      files-directory = "/home/${username}/files";
      config-directory = "/home/${username}/files/dev-nix/nix-config";
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
