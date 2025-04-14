{
  inputs ={
    nixpkgs.url = "nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable"; # Input is pinned in `flake.lock`. Update with `nix flake lock --update-input nixpkgs-unstable`
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    yazi.url = "github:sxyazi/yazi";
  };
  outputs = {
    self,
    nixpkgs,
    home-manager,
    yazi,
    ...
  } @ inputs: let
    # These are additional arguments which we pass to each NixOS system.
    args = { 
      flakeInputs = inputs;
      flakeOutputs = self.outputs;
    };
    # This goes for all systems
    mkNixosSystem = { name, system, modules ? [] }: nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        { _module.args = args; }
        home-manager.nixosModules.default
        (./hosts + "/${name}/configuration.nix")
        ./shared/nix/common-nix-options.nix
        ./shared/nix/common-hm-options.nix
        {
          networking.hostName = name;
        }
      ] ++ modules;
    };
  in {
    nixosConfigurations = {
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
          ./shared/nix/common-nixos-options.nix
          ./shared/nix/mads-user.nix
          ./shared/nix/de-essentials.nix
          ./shared/nix/gnome-essentials.nix
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
