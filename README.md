# It's All Nix!

> She Nix on my module till I flake

## How to use
1. Download the repository:
```sh
curl -O https://github.com/zzzealed/its-all-nix/archive/refs/heads/main.tar.gz`
```
2. Unzip with:
```sh
tar -xvzf main.tar.gz
```
3. Enter and run: 
```sh
cd main && nix-shell
```
4. Rebuild with a host (eg. desktop-nixos) configuration:
```nix
sudo nixos-rebuild switch --flake .#desktop-nixos
```

![Kamala on the vape 😤😤😤](./kamala.jpeg)
