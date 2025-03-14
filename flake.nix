  # Inputs needed for packages?
{
  inputs ={
    nixpkgs = {
      url = "nixpkgs/nixos-24.11";
    };
    # NOTE: Remember that this input is still pinned in `flake.lock`. You have to run
    # `nix flake lock --update-input nixpkgs-unstable` to update the pinned
    # version to the most recent commit on Github.
    nixpkgs-unstable = {
      url = "nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    linus-n00b = {
      url = "git+https://git.linus.onl/nix-monorepo.git";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixos-wsl,
    linus-n00b,
    ...
  } @ inputs: let
    # These are additional arguments which we pass to each NixOS system.
    args = { 
      flakeInputs = inputs;
      flakeOutputs = self.outputs;
      metadata = nixpkgs.lib.importTOML ./hosts/hosts.toml;
    };

    mkNixosSystem = { name, system, modules ? [] }: nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        { _module.args = args; }
        home-manager.nixosModules.default
        (./hosts + "/${name}/configuration.nix")
        ./shared/nix/common-nix-options.nix
        ./shared/nix/common-hm-options.nix
      ] ++ modules;
    };
  in {
    nixosConfigurations = {
      laptop-wsl = mkNixosSystem {
        name = "laptop-wsl";
        system = "x86_64-linux";
        modules = [
          ./shared/nix/mads-user.nix
          ./shared/nix/extra-video-packages.nix
        ];
      };

      laptop2-nixos =  mkNixosSystem {
        name = "laptop2-nixos";
        system = "x86_64-linux";
        modules = [
          ./shared/nix/common-nixos-options.nix
          ./shared/nix/mads-user.nix
          ./shared/nix/de-essentials.nix
          ./shared/nix/gnome-essentials.nix
          ./shared/nix/laptop-essentials.nix
          ./shared/nix/extra-video-packages.nix
        ];
      };

      laptop3-nixos = mkNixosSystem {
        name = "laptop3-nixos";
        system = "x86_64-linux";
        modules = [
          ./shared/nix/mads-user.nix
          ./shared/nix/desktop-essentials.nix
          ./shared/nix/extra-video-packages.nix
        ];
      };

      server-nixos = mkNixosSystem {
        name = "server-nixos";
        system = "x86_64-linux";
        modules = [
          ./shared/nix/common-nixos-options.nix
          ./shared/nix/mads-user.nix
          ./shared/nix/extra-video-packages.nix
          ./shared/nix/additional-users.nix
          linus-n00b.nixosModules.qbittorrent
          ./shared/nix/cachix.nix
        ];
      };

      pi-nixos = mkNixosSystem {
        name = "pi-nixos";
        system = "aarch64-linux";
        modules = [
          ./shared/nix/common-nixos-options.nix
          ./shared/nix/mads-user.nix
        ];
      };
    };
  }; 
}
