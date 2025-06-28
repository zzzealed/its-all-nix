{ pkgs, ... }:

{
  programs.mpv = {
    enable = true;
    package = (
      pkgs.unstable.mpv-unwrapped.wrapper {
        scripts = with pkgs.mpvScripts; [
           # None atm. See `shared/home-manager/mpv/config/scripts/`
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
}
