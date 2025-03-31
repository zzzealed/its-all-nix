{ pkgs, flakeInputs, ... }:
{
  imports = [
    ../home-manager/localsend
  ];
  config = {
    services.xserver.enable = true;
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
    environment.systemPackages = with pkgs; [
      unstable.firefox
      dorion
      tidal-hifi
      unstable.input-leap
    ];
  };
}
