% nixos-rebuild, flake
# Rebuild with `flake.nix` and host
```sh
sudo nixos-rebuild <option> --flake .#<host>
```
$ option: echo -e "switch\nboot\ntest\nbuild\ndry-activate\nbuild-vm"
$ host: nix flake show 2>&1 | grep -oP '(├───|└───)\K[^:]+'

% nixos-rebuild, flake, remote
# Rebuild for remote host via. SSH
```sh
sudo nixos-rebuild --target-host <remote_host> --use-remote <option> --flake .#<host>
```
$ remote_host:
$ option: echo -e "switch\nboot\ntest\nbuild\ndry-activate\nbuild-vm"
$ host: nix flake show 2>&1 | grep -oP '(├───|└───)\K[^:]+'

% nix, search
# Search for package
```sh
nix search <input> <package>
```
$ input: echo -e "nixpkgs\nnixpkgs-unstable"
$ package:

% nix, flake, update, upgrade
# Update `flake.lock`
```sh
nix flake update --update-input <input>
```
$ input: nix flake metadata

% nix, garbage
# Garbage collect and delete generations older than eg. 15 days.
```sh
sudo nix-collect-garbage --delete-old
```

% nix, run
# Run package once
```sh
nix run <input>#<package> <option>
```
$ input: echo -e "nixpkgs\nnixpkgs-unstable"
$ package:
$ option:

% nix, shell
# Make shell with package
```sh
nix-shell -p <package>
```
$ package:

% nix, nix-shell, flake
# Check if you are in a Nix shell or Nix flake development env
```sh
echo <option>
```
$ option: $NIX_SHELL $NIX_DEV
