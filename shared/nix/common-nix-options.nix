{ pkgs, flakeInputs, ... }:
{
  config = {
    # Global config
    nix.settings.experimental-features = ["nix-command" "flakes"]; # Enable flakes and nix3 commands globally
    nixpkgs.config.allowUnfree = true; # Allow unfree packages in global config
    users.mutableUsers = false; # If set to false, the contents of the user and group files will simply be replaced on system activation. This also holds for the user passwords; all changed passwords will be reset according to the users.users configuration on activation.
    environment.systemPackages = with pkgs; [ vim tree git wget home-manager ]; # The very essential packages
    # SSH
    services.openssh = {
      enable = true;
      settings.PasswordAuthentication = true;
    };
    # nixpkgs-unstable overlay
    nixpkgs.overlays = [
      (final: _prev: {
        unstable = import flakeInputs.nixpkgs-unstable {
          config.allowUnfree = true; # This is a different nixpkgs instance so we need to pass this again
          system = final.system;
        };
      })
    ];
  };
}
