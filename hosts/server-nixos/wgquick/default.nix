{ config, pkgs, ... }:

{
  networking.wg-quick.interfaces = {
    wg0 = {
      configFile = "/home/mads/its-all-nix/hosts/server-nixos/wgquick/wg0.conf";  # Path to your wg0.conf file
      autostart = true;  # Automatically start the interface at boot
    };
  };
}
