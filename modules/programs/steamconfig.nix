{ pkgs, config, ... }:
{
  programs.gamemode.enable = true;
  programs.gamescope.enable = true;

  config.systemPackages = with pkgs; [
    mangohud
  ];
}
