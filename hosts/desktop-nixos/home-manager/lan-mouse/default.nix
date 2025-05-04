{ lib, pkgs, ... }:

{
  config = {
    home.file.".config/lan-mouse" = {
      source = ./config;
      recursive = true;
    };
  };
}
