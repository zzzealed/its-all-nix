{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = { self, nixpkgs }: {
    devShell.x86_64-linux =
      let
        pkgs = import nixpkgs {
          system = "x86_64-linux";
        };

        # Define the repository to fetch
        repo = pkgs.fetchgit {
          url = "https://github.com/rtuszik/KoalaKeys";
          rev = "main"; # Use branch name or specific commit hash
          # sha256 can be omitted for dynamic fetching, but specifying it improves reproducibility
        };
      in
      pkgs.mkShell {
        name = "python-env";

        # Add build inputs
        buildInputs = [
          (pkgs.python39.override {
            packageOverrides = python-self: python-super: {
              jinja2 = python-super.jinja2.overrideAttrs (_: {
                version = "3.1.4";
              });
              python-dotenv = python-super.python-dotenv.overrideAttrs (_: {
                version = "1.0.1";
              });
              ruamel.yaml = python-super.ruamel.yaml.overrideAttrs (_: {
                version = "0.18.6";
              });
            };
          })
          pkgs.git
        ];
        # Set environment variables
        env = {
          CHEATSHEET_OUTPUT_DIR = "./html";
        };

        # Automatically use the cloned repo as the working directory
        shellHook = ''
          echo "Entering development shell with the latest repository..."
          cd ${repo}
        '';
      };
  };
}

