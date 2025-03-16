{
  config = {

    nix.settings.trusted-users = [
      "mads"
    ];
    
    # User(s)
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
    };

    # Home Manager
    home-manager.users.mads = {
      xdg.enable = true;
      imports = [
        ../home-manager/mpv
        ../home-manager/git
        ../home-manager/helix
      ];
    };
  };
}
