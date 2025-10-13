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
    "atuin" # command history (ctrl + r)

    "git" # version control
    "extras-cli" # misc extras
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
    map (program: ../programs/${program}) programs
    ++ map (program: ../programs/${program}) guiPrograms
    ++ map (program: ../programs/${program}) schoolPrograms
    ++ map (program: ../programs/${program}) hyprDE
    ++ map (secret: ../secrets/${secret}.nix) secrets
    ++ [
      {_module.args = {inherit username;};}
      inputs.home-manager.nixosModules.home-manager
    ];

  config = {
    # inherit username;
    users.users.${username} = {
      name = username;
      description = username;

      isNormalUser = true;
      useDefaultShell = true;
      extraGroups = ["wheel" "networkmanager"];
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
