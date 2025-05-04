{ lib, flakeInputs, pkgs, ... }:

{
  config = {
    home.file.".config/ghostty/config" = {
      source = ./config/config; # Config file is just called `config` which makes it a bit confusing ;)
    };
  };
}
