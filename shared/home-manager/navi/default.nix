{ lib, pkgs, ... }:

{
  config = {
    home.packages = [ pkgs.unstable.navi ];
    home.file.".local/share/navi/cheats" = {
      source = ./config;
      recursive = true;
    };
  };
}
