# 
# This file sets common Nix options. This one I have no clue.
#

{ pkgs, flakeInputs, ... }:

{
  config = {
    # Enable flakes and nix3 commands everywhere!!
    nix.settings.experimental-features = ["nix-command" "flakes"];

    # "Ja det er fordi jeg ikke har nogen rygrad." – Linus
    nixpkgs.config.allowUnfree = true;

    nixpkgs.overlays = [
      (final: _prev: {
        unstable = import flakeInputs.nixpkgs-unstable {
          # Here we have to forward any important arguments to nixpkgs. This is
          # an entirely different instantiation nixpkgs.
          # Example: We haven't set `config.allowUnfree == true` so, even
          # though it's set for the global nixpkgs above, you won't be able to
          # access `pkgs.unstable.chrome`, unless you ALSO pass `allowUnfree`
          # here.
          system = final.system;
        };
      })
    ];

    users.mutableUsers = false; # If set to false, the contents of the user and group files will simply be replaced on system activation. This also holds for the user passwords; all changed passwords will be reset according to the users.users configuration on activation.

    # SSH
    services.openssh = {
      enable = true;
      settings.PasswordAuthentication = true;
    };


    # Shared packages between hosts. The very essentials.
    environment.systemPackages = with pkgs; [
      vim
      tree
      gitMinimal
      fastfetch
      wget
    ];
  };
}
