{ pkgs, config, flakeInputs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];
  config = {
    # Packages
    environment.systemPackages = with pkgs; [
      cifs-utils
      ghostty
      streamcontroller
      vesktop
      scrcpy
      android-tools
      ntfs3g
      samba
      kdePackages.dolphin-plugins
      kdePackages.filelight
      kdePackages.xdg-desktop-portal-kde
      prismlauncher
      kdePackages.plasma-browser-integration
      gamescope
      rclone
      krita
    ];

  programs.adb.enable = true;

  home-manager.users.mads = {
    xdg.enable = true;
    imports = [
      ./home-manager/mpv
      ./home-manager/lan-mouse
      ./home-manager/mangohud
    ];
  };

  # Mount Samba shares
  fileSystems."/mnt/server-nixos/vault" = {
    device = "//server.l.zzzealed.com/vault";
    fsType = "cifs";
    options = let
      # this line prevents hanging on network split
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

    in ["${automount_opts},credentials=/etc/nixos/smb-secrets,uid=1000,gid=100"];
  };
  fileSystems."/mnt/server-nixos/vault2" = {
    device = "//server.l.zzzealed.com/vault2";
    fsType = "cifs";
    options = let
      # this line prevents hanging on network split
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

    in ["${automount_opts},credentials=/etc/nixos/smb-secrets,uid=1000,gid=100"];
  };
  fileSystems."/mnt/server-nixos/home" = {
    device = "//server.l.zzzealed.com/home";
    fsType = "cifs";
    options = let
      # this line prevents hanging on network split
      automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

    in ["${automount_opts},credentials=/etc/nixos/smb-secrets,uid=1000,gid=100"];
  };

  # Mount WebDAV share
  services.davfs2.enable = true;
  
  
  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [ proton-ge-bin ];
  };
  programs.gamemode.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true; boot.loader.efi.canTouchEfiVariables = true;

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [nvidia-vaapi-driver];
  };

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = false; # Set to false to use the proprietary kernel module

  boot.supportedFilesystems = [ "ntfs" ];
  fileSystems."/mnt/Samsung" =
    { device = "/dev/disk/by-uuid/EEA23721A236EE29";
      fsType = "ntfs-3g"; 
      options = [ "rw" "uid=1000"];
    };

  programs.xwayland.enable = true;

  xdg.icons.fallbackCursorThemes = [ "breeze_cursors" ];

  # KDE
  services.displayManager.sddm.enable = true; services.desktopManager.plasma6.enable = true;

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It's perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "24.11"; # Did you read the comment?

    # Same ordeal for Home Manager.
    # We do it like this since the starting HM version is unique per-host.
    home-manager.users.mads.home.stateVersion = "24.11";
  };
}
