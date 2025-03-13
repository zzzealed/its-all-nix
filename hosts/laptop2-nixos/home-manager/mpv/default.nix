{ pkgs, ... }:

{
  config = {
    home.packages = [ pkgs.unstable.mpv ];

    # Manually copy MPV configuration ranther than using the HM module.
    # I do this becuase I may want to move the files somewhere else later.
    home.file.".config/mpv/host.conf" = {
      source = ./config/host.conf;
    };
  };
}
