{
  username,
  inputs,
  ...
}: {
  home-manager.users.${username} = {
    programs.jujutsu = {
      enable = true;

      settings = {
        inherit (inputs.nix-secrets.git.personal) name email;
      };
    };
  };
}
