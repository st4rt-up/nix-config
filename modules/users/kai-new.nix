{inputs, ...}: let
  name = "kai";

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
in {
  # took this pattern, makes it easier to put non-home or system programs in one place
  # https://github.com/minusfive/dot/blob/main/nix/users/minusfive/aarch64-darwin.nix
  imports =
    map (program: ../programs/${program}) programs
    ++ map (program: ../programs/${program}) guiPrograms
    ++ map (program: ../programs/${program}) schoolPrograms
    ++ map (program: ../programs/${program}) hyprDE 
    ++ [
      inputs.home-manager.nixosModules.home-manager
    ];

  config = {
    username = name;
    _module.args.username = name;
    users.users.${name} = {
      inherit name;
      description = name;

      isNormalUser = true;
      useDefaultShell = true;
      extraGroups = ["wheel" "networkmanager"];
    };

    home-manager = {
      users.${name} = {
        home.username = name;
        home.stateVersion = "24.11";
        programs.home-manager.enable = true;
      };

      useUserPackages = true;
      useGlobalPkgs = true;
      backupFileExtension = "hmbackup";
    };
  };
}
