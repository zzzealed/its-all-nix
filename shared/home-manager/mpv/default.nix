{ lib, pkgs, ... }:

{
  config = {
    programs.mpv = {
      enable = true;
      package = (
        pkgs.unstable.mpv-unwrapped.wrapper {
          scripts = with pkgs.mpvScripts; [
             mpris
          ];
 
          mpv = pkgs.unstable.mpv-unwrapped.override {
            waylandSupport = true;
          };
        }
      );
    };
    home.file.".config/mpv" = {
      source = ./config;
      recursive = true;
    };
  };
}
