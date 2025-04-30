{ lib, pkgs, ... }:

{
  config = {
    # Link the shared MPV configuration
    home.file.".bashrc" = {
      source = ./config/.bashrc;
    };
  };
}
