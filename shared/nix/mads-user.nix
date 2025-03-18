{ pkgs, flakeInputs, ... }:
{
  config = {
    nix.settings.trusted-users = [
      "mads"
    ];
    programs.fish.enable = true;
    users.users.mads = {
      description = "Main user account";
      isNormalUser = true;
      hashedPassword = "$y$j9T$6vFvxN86DFTOIwcl.Zq6e0$gl59welPFvDnvVrAdaE4zbN8QO2Qir6rwVbrmdfPM97";
      home = "/home/mads";
      extraGroups = [
        "wheel" # sudo access
        "docker"
        "samba"
        "vault"
      ];
      packages = with pkgs; [
        zellij
        unstable.yazi
        bat
        eza
        fd
        ripgrep
        fzf
        tealdeer
        navi
      ];
    };
    home-manager.users.mads = {
      xdg.enable = true;
      programs.fish.enable = true;
      imports = [
        ../home-manager/mpv
        ../home-manager/git
        ../home-manager/helix
      ];
    };
  };
}
