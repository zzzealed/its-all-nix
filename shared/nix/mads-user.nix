{ pkgs, flakeInputs, ... }:
{
  config = {
    nix.settings.trusted-users = [ "mads" ]; # Add my user as trusted. Needed for remote rebuilds
    users.users.mads = {
      description = "Mads";
      isNormalUser = true;
      hashedPassword = "$y$j9T$6vFvxN86DFTOIwcl.Zq6e0$gl59welPFvDnvVrAdaE4zbN8QO2Qir6rwVbrmdfPM97";
      home = "/home/mads";
      extraGroups = [ "wheel" "docker" ];
      linger = true;
      packages = with pkgs; [
        fastfetch
        unstable.zellij     
        unstable.uutils-coreutils
        tokei
        bat
        fzf
        skim
        tealdeer
        navi
        mozillavpn
      ];
    };
    # HM user specific stuff
    home-manager.users.mads = {
      xdg.enable = true;
      imports = [
        ../home-manager/mpv
        ../home-manager/git
        ../home-manager/helix
        ../home-manager/yazi
      ];
    };
  };
}
