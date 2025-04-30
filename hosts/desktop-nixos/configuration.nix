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
      protonup-qt
    ];

  programs.steam.enable = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true; boot.loader.efi.canTouchEfiVariables = true;

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [nvidia-vaapi-driver];
  };

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = false; # Set to false to use the proprietary kernel module

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
