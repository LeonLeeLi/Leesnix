{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ];

  services.flatpak = {
    enable = true;
    packages = [
      "com.usebottles.bottles"
    ];
    update.auto = {
      enable = true;
      onCalendar = "weekly";
    };
    uninstallUnmanaged = true;
  };
}
