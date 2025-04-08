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
      unstable.dorion
      unstable.tidal-hifi
      unstable.input-leap
    ];
  };
}
