{ pkgs, flakeInputs, ... }:

{
  imports = [
    ../home-manager/localsend
  ];

  config = {
    # Enable the X11 windowing system.
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
