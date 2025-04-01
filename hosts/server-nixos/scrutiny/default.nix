{ config, lib, pkgs, ... }:
{
  config = {
    services.scrutiny = {
      enable = true;
      openFirewall = true;
      collector.enable = true;
      settings.web.listen.port = 50236;
    };
  };
}
