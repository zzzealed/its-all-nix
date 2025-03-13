# NOTE: Despite file name, this file defines a NIXOS module, NOT a home-manager
# module. That is, the definitions inside `.config` are setting values for NixOS
# options, not per-user HM options.

{ pkgs, lib, config, flakeInputs, flakeOutputs, metadata, ... }:

{
  config = {
    # Use the flake input pkgs so home manager configuration can share overlays
    # etc. with the rest of the configuration.
    home-manager.useGlobalPkgs = true;

    # Pass special arguments from flake.nix further down the chain. I really hate
    # this split module system.
    home-manager.extraSpecialArgs = { inherit flakeInputs flakeOutputs metadata; };

    # Home Manager got angwy
    home-manager.backupFileExtension = "bak";
  };
}