{ config, lib, pkgs, ... }:
{
  config = {
    services.searx = {
      enable = true;
      package = pkgs.searxng;
      settings = {
        server.port = 8609;
        server.bind_address = "0.0.0.0";
        server.secret_key = "blahblahblah";
      };
    };
    networking.firewall = { allowedTCPPorts = [ 8609 ]; };
  };
}
