{ config, pkgs, ... }:

{
  networking.wg-quick.interfaces = {
    wg0 = {
      configFile = "/home/mads/its-all-nix/hosts/server-nixos/wgquick/wg0.conf";  # Path to your wg0.conf file
      autostart = true;  # Automatically start the interface at boot
      postUp = [
        "ip rule add from 192.168.0.0/16 table main prio 10"
        "ip rule add from 172.17.0.0/16 table main prio 20"
      ];
      postDown = [
        "ip rule del from 192.168.0.0/16"
        "ip rule del from 172.17.0.0/16"
      ];
    };
  };
}
