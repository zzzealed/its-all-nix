{ lib, pkgs, ... }:

{
  programs.firefox.profiles = {
    mads = {
      settings = ./config/user.js;
    };  
  };
}
