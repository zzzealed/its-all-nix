{ lib, pkgs, ... }:

{
  config = {
    home.packages = [ pkgs.unstable.helix ];

    # Link the shared MPV configuration
    home.file.".config/helix" = {
      source = ./config;
      recursive = true;
    };
  };
}
