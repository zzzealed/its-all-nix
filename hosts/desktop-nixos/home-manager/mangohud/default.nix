{ config, lib, pkgs, flakeInputs, flakeOutputs, ... }:

{
  config = {
    home.packages = [ mangohud ];
    home.file.".config/MangoHud" = {
      source = ./config;
      recursive = true;
    };
  };
}
