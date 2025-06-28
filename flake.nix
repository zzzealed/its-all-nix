{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable"; # Input is pinned in `flake.lock`. Update with `nix flake lock --update-input nixpkgs-unstable`
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    yazi.url = "github:sxyazi/yazi";
    tagstudio = {
      url = "github:TagStudioDev/TagStudio";
      #inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    self,
    nixpkgs,
    home-manager,
    yazi,
    tagstudio,
    ...
  } @ inputs: let
    # This goes for all systems
    mkNixosSystem = { name, system, modules ? [] }: nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { # We use specialArgs rather than the option _module.args to ensure that these can be used in import statements.
        flakeInputs = inputs;
        flakeOutputs = self.outputs;
        inherit inputs;
      };
      modules = [
        home-manager.nixosModules.default
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {
              inherit inputs self yazi;
            };
          };
        }
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
      desktop-nixos = mkNixosSystem {
        name = "desktop-nixos";
        system = "x86_64-linux";
        modules = [
	        ./shared/nix/common-nixos-options.nix
          ./shared/nix/mads-user.nix
          ./shared/nix/de-essentials.nix
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
