{ lib, pkgs, ... }:

{
  config = {
    home.file.".gitconfig" = {
      source = ./config/.gitconfig;
    };
  };
}
