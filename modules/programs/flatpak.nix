{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
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
