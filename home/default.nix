{ config, pkgs, lib, inputs, ... }:
{
  imports = [
    ./user.nix
    ./packages.nix
    ./programs
    ./systemd.nix
  ];
}
