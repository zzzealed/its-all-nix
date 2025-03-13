{ lib, pkgs, ... }:

{
  config = {
    home.packages = [ pkgs.git ];

    # Link the shared git configuration
    home.file.".gitconfig" = {
      source = ./config/.gitconfig;
    };
  };
}
