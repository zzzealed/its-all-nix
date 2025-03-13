{ config, lib, pkgs, ... }:
{
  config = {
    services.ollama = {
      enable = true;
      package = pkgs.unstable.ollama-cuda;
      acceleration = "cuda";
    };
  };
}
