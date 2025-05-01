{ lib, flakeInputs, pkgs, ... }:

{
  config = {
    home.file.".config/mpv/host.conf" = {
      source = ./config/host.conf;
    };
  };
}
