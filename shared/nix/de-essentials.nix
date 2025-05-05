{ config, pkgs, inputs, flakeInputs, ... }:
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
      input-leap
      lan-mouse
      libreoffice
      ungoogled-chromium
#      inputs.tagstudio.packages.${pkgs.stdenv.hostPlatform.system}.tagstudio
    ];
    networking.firewall = { allowedTCPPorts = [ 24800 4242 ]; }; # for lan-mouse
  };
}
