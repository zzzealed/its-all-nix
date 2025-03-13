{ pkgs, ... }:

{
  config = {
    # Enable the GNOME Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    # Goodbye xterm
    services.xserver.excludePackages = [ pkgs.xterm ];

    environment.gnome.excludePackages = (with pkgs; [
      #snapshot
      #baobab
      gnome-text-editor
      gnome-tour
      evince
      loupe
      simple-scan
      yelp
      gnome-calculator
      gnome-clocks
      gnome-contacts
      gnome-logs
      #gnome-calendar
      #gnome-characters
      #gnome-disk-utility
      #gnome-font-viewer
      #gnome-system-monitor
      #gnome-shell-extensions
      gnome-logs
      totem
      geary
      gnome-weather
      gnome-maps
      gnome-music
      epiphany
      seahorse
      file-roller
    ]);
  };
}
