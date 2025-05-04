{ pkgs, flakeInputs, ... }:
{
  imports = [
    ../home-manager/localsend
  ];
  config = {
    services.xserver.enable = true;
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [ xdg-desktop-portal-gtk xdg-desktop-portal-kde ];
      config.common.default = [ "kde" ];
    };
    environment.systemPackages = with pkgs; [
      unstable.firefox
      unstable.dorion
      unstable.tidal-hifi
      kdePackages.kdeconnect-kde
      xdg-desktop-portal
      xdg-desktop-portal-gtk
      xdg-desktop-portal-kde
      lan-mouse
      libreoffice
      ungoogled-chromium
    ];
    networking.firewall = { allowedTCPPorts = [ 4242 ]; }; # for lan-mouse
  };
}
