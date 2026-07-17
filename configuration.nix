{ config, pkgs, lib,... }:
{

  imports = [
    ./hardware-configuration.nix
    ./modules/system
    ./modules/desktop
    ./modules/services
    ./modules/programs
    ./modules/virtualisation
    ./modules/users
    ./modules/environment.nix
    ./modules/state.nix
  ];
  

}
