{ pkgs, config, flakeInputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./docker
    ./smb-shares
  ];

    # Bootloader
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/mmcblk0";
    boot.loader.grub.useOSProber = true;

  
    networking.firewall = {
      enable = true;
      allowedTCPPorts = [ 80 443 11001 8020 3001 ];
      allowedUDPPorts = [];
    };

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It's perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "24.05"; # Did you read the comment?

    # Same ordeal for Home Manager.
    # We do it like this since the starting HM version is unique per-host.
    home-manager.users.mads.home.stateVersion = "24.05";
}
