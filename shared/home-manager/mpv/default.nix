{ lib, pkgs, ... }:

{
  config = {
    home.packages = [ pkgs.unstable.mpv ];

    # Link the shared MPV configuration
    home.file.".config/mpv" = {
      source = ./config;
      recursive = true;
    };
  };
}
