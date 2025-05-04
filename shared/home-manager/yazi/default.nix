{ config, lib, pkgs, flakeInputs, flakeOutputs, yazi, ... }:

{
  config = {
    home.file.".config/yazi" = {
      source = ./config;
      recursive = true;
    };
  };
}
