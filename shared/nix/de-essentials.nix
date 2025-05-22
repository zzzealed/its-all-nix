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
      extraPortals = with pkgs; [ xdg-desktop-portal-kde xdg-desktop-portal-wlr xdg-desktop-portal-gtk ];
      config.common.default = [ "kde" ];
    };  
    environment.systemPackages = with pkgs; [
      unstable.dorion
      unstable.tidal-hifi
      input-leap
      lan-mouse
      libreoffice
      ungoogled-chromium
      inputs.tagstudio.packages.${pkgs.stdenv.hostPlatform.system}.tagstudio
      obs-studio
    ];

    programs.firefox.enable = true;
    
    networking.firewall = { allowedTCPPorts = [ 24800 4242 ]; }; # for lan-mouse
  };
}
