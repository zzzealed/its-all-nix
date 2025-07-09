{ pkgs, lib, ... }:
{
  systemd.services.rust-gameserver = {
    enable = true;
    serviceConfig = {
      ExecStart = "${lib.getExe pkgs.steam-run} ./runds.sh";
      WorkingDirectory = "/home/mads/its-all-nix/hosts/server-nixos/rust-gameserver/data";
    };
    wantedBy = [ "multi-user.target" ];
  };
networking.firewall = { allowedUDPPorts = [ 28015 ]; allowedTCPPorts = [ 28016 ]; };
}
