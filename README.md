# st4rt's nix config

## File structure
- hosts
- modules
  - core (nixos specific configuration)
  - programs (notes below)
  - system (configuration normally involved with hardware goes here)
  - themes (will get to restructuring soon)
  - users (notes below)
- wallpaper

## modules/programs
Every file in program is expecting a 'username' input
Home level configuration and system level configuration is done in the same file
Dotfiles are stored in a program's ``./dotfiles`` folder where it is symlinked into 
the correct location

