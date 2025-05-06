{ config, lib, pkgs, flakeInputs, flakeOutputs, yazi, ... }:

{
  config = {
    home.packages = [ yazi.packages.${pkgs.system}.default pkgs.ueberzugpp ];
    home.file.".config/yazi" = {
      source = ./config;
      recursive = true;
    };
  };
}
