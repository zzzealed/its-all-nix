{ lib, pkgs, ... }:

{
  config = {
    home.file.".config/mpv" = {
      source = ./config;
      recursive = true;
    };
  };
}
