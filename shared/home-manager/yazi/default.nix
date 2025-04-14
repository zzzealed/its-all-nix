{ config, lib, pkgs, flakeInputs, flakeOutputs, yazi, ... }:

{
  config = {
    home.packages = [ pkgs.unstable.yazi ];

    # Link the shared MPV configuration
    home.file.".config/yazi" = {
      source = ./config;
      recursive = true;
    };
  };
}
