# Stolen from https://github.com/jnsgruk/nixos-config/blob/main/shell.nix
{
  default = pkgs.mkShell {
    name = "flake";
    # Enable experimental features without having to specify the argument
    NIX_CONFIG = "experimental-features = nix-command flakes";
    nativeBuildInputs = with pkgs; [
      nix
      home-manager
      git
    ];
  };
}
