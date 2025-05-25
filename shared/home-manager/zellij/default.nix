{ lib, pkgs, ... }:

{
  config = {
    home.packages = [ pkgs.unstable.zellij ];
    home.file.".config/zellij" = {
      source = ./config;
      recursive = true;
    };
  };
}
