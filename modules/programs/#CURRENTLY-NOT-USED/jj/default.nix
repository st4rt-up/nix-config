<<<<<<< HEAD:modules/programs/jj/default.nix
{
  username,
  inputs,
  ...
}: {
=======
# currently requires home-manager
{username, ...}: {
>>>>>>> niri-and-dotfiles-rework:modules/programs/#CURRENTLY-NOT-USED/jj/default.nix
  home-manager.users.${username} = {
    programs.jujutsu = {
      enable = true;

      settings = {
        inherit (inputs.nix-secrets.git.personal) name email;
      };
    };
  };
}
