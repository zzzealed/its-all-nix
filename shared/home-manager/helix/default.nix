{ lib, pkgs, ... }:

{
  config = {
    home.packages = [ pkgs.unstable.helix pkgs.unstable.helix-gpt ];
    home.file.".config/helix" = {
      source = ./config;
      recursive = true;
    };
  };
}
