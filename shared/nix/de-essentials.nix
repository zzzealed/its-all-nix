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
    };
    environment.systemPackages = with pkgs; [
      unstable.firefox
      unstable.dorion
      unstable.tidal-hifi
      input-leap
      kdePackages.kdeconnect-kde
    ];
  };
}
