{ lib, pkgs, ... }:

{
  config = {
    home.packages = with pkgs; [
      unstable.helix
      unstable.helix-gpt
      # Language servers
      bash-language-server
      clang-tools
      vscode-langservers-extracted
      docker-language-server
      marksman
      nil
      python313Packages.python-lsp-server
      rust-analyzer
      svelte-language-server
      sqls
      tailwindcss-language-server
      opentofu-ls
      taplo
      typescript-language-server
      yaml-language-server
    ];
    home.file.".config/helix" = {
      source = ./config;
      recursive = true;
    };
  };
}
