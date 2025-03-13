{ config, lib, pkgs, ... }:
{
  config = {
    services.qbittorrent = { 
      enable = true;
      package = pkgs.qbittorrent-nox.overrideAttrs (_old: rec { # `rec` because we use version again
        version = "4.6.5";
        src = pkgs.fetchFromGitHub {
          owner = "qbittorrent";
          repo = "qBittorrent";
          rev = "release-${version}";
          hash = "sha256-umJObvPv4VjdAZdQEuhqFCRvi1eZQViu1IO88oeTTq8="; 
        };
      });
    };
  };
}