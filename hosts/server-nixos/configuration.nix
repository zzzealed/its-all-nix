{ pkgs, config, flakeInputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./docker
    ./smb-shares
    #./ollama
    #./qbittorrent-nox
    #./wgquick
  ];

   config = {
    # Bootloader
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/sde";
    boot.loader.grub.useOSProber = true;

    boot.supportedFilesystems = [ "zfs" ];
    boot.zfs.forceImportRoot = false;
    networking.hostId = "3f39026e";

    boot.zfs.extraPools = [ "vault" "vault2" ];

    environment.systemPackages = with pkgs; [
      nvidia-container-toolkit
      cudaPackages.cudatoolkit
      zfs
      samba
      cachix
      streamrip
      protonvpn-cli
      rsync
    ];

    boot.binfmt.emulatedSystems = [
      "aarch64-linux"
    ];

    hardware.graphics.enable = true;
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia-container-toolkit.enable = true;
    boot.kernelModules = [ "nvidia" ];
    boot.extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
    hardware.nvidia = {

      # Modesetting is required.
      modesetting.enable = true;
  
      # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
      # Enable this if you have graphical corruption issues or application crashes after waking
      # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
      # of just the bare essentials.
      powerManagement.enable = false;
  
      # Fine-grained power management. Turns off GPU when not in use.
      # Experimental and only works on modern Nvidia GPUs (Turing or newer).
      powerManagement.finegrained = false;
  
      # Use the NVidia open source kernel module (not to be confused with the
      # independent third-party "nouveau" open source driver).
      # Support is limited to the Turing and later architectures. Full list of 
      # supported GPUs is at: 
      # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
      # Only available from driver 515.43.04+
      # Currently alpha-quality/buggy, so false is currently the recommended setting.
      open = false;
  
      # Enable the Nvidia settings menu,
     	# accessible via `nvidia-settings`.
      nvidiaSettings = true;
  
      # Optionally, you may need to select the appropriate driver version for your specific GPU.
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
    
    networking.firewall = {
      enable = true;
      allowedTCPPorts = [ 80 443 11001 8020 3001 ];
      allowedUDPPorts = [];
    };

    users.groups = {
        vault = { gid = 1001; };
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
  };
}
