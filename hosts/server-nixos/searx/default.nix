{ config, lib, pkgs, ... }:
{
  config = {
    services.searx = {
      enable = true;
      package = "pkgs.searxng";
    };
  };
}
