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
    "atuin" # command history (ctrl + r)

    "git" # version control
    "jj"
    "extras-cli" # misc extras
    "usb"
  ];

  guiPrograms = [
    "nixcord" # declarative vencord
    "zen-browser" # firefox fork

    "obsidian" # markdown note taking
    "okular" # pdf reader

    "kitty" # terminal emulator
  ];

  schoolPrograms = [
    "school-packages"
    "pdf-utilities"
  ];
  niriDE = [
    "niri"

    "wofi"
    "mako"

    "waybar"
  ];
  hyprDE = [
    "wayland"
    "wayland-utils" # grim + hyprland binds ()
    "swayosd" # brightness and volume for wayland

    "wofi" # application launcher
    "mako" # notification daemon

    "hyprland" # compositor / window server
    "waybar" # bar
  ];

  secrets = [
    "users/kai"
  ];
in {
  # took this pattern, makes it easier to put non-home or system programs in one place
  # https://github.com/minusfive/dot/blob/main/nix/users/minusfive/aarch64-darwin.nix
  imports =
    builtins.concatMap (map (program: ../programs/${program})) [
      programs
      guiPrograms
      schoolPrograms
      hyprDE
      niriDE
    ]
    ++ map (secret: ../secrets/${secret}.nix) secrets
    ++ [
      {_module.args = {inherit username;};} # messy but it lets me do user specific config
      inputs.home-manager.nixosModules.home-manager
    ];

  config = {
    # inherit username;
    users.users.${username} = {
      name = username;
      description = username;

      isNormalUser = true;
      useDefaultShell = true;
      extraGroups = [
        "wheel"
        "networkmanager"
        "audio"
      ];
    };

    # options defined by me
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
