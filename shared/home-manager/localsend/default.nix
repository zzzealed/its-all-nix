{ pkgs, ... }:

{
  config = {
    environment.systemPackages = with pkgs; [
      localsend
    ];
    # Open firewall for LocalSend
    networking.firewall = {
      allowedTCPPorts = [ 53317 ];
      allowedUDPPorts = [ 53317 ];
    };
  };
}
