{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  imports = [
    ./user.nix
    ./packages.nix
    ./programs
    ./environment.nix

  ];

}
