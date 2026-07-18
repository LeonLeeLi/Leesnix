{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wget
    git
    noto-fonts-cjk-sans
    ntfs3g
    gamemode
    alsa-utils
  ];
}
