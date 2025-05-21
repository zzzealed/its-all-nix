{ config, lib, pkgs, flakeInputs, flakeOutputs, ... }:

{
  config = {
    home.packages = [ pkgs.mangohud ];
    home.file.".config/MangoHud" = {
      source = ./config;
      recursive = true;
    };
  };
}
