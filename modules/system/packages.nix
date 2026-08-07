{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    wget
    git
    noto-fonts-cjk-sans
    ntfs3g
    pciutils
    psmisc
    lact
    powerstat
    aria2
    gparted
    podman-tui
    podman-desktop
    podman-compose
    wineWow64Packages.stagingFull
    winetricks
    file
    powershell
    distrobox
    xwayland-satellite
    cudatoolkit
  ];
}
