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
      "org.gnome.Boxes"
    ];
    update.auto = {
      enable = true;
      onCalendar = "weekly";
    };
    uninstallUnmanaged = true;
  };
}
