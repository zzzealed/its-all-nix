# NOTE: Despite file name, this file defines a NIXOS module, NOT a home-manager
# module. That is, the definitions inside `.config` are setting values for NixOS
# options, not per-user HM options.
{ pkgs, lib, config, flakeInputs, flakeOutputs, metadata, ... }:
{
  config = {
    home-manager.useGlobalPkgs = true; # Use flake inputs pkgs so HM can share overlays with the rest of the configuration
    home-manager.extraSpecialArgs = { inherit flakeInputs flakeOutputs metadata; }; # Pass special arguments from flake further down
    home-manager.backupFileExtension = "bak"; # Appends ".bak" when backing up configs
  };
}
