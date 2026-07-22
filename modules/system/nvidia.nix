{ lib, ... }:
{

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;
  hardware.nvidia.nvidiaSettings = true;
  hardware.nvidia.nvidiaPersistenced = true;
  hardware.nvidia.powerManagement.enable = true;
  hardware.nvidia.powerManagement.finegrained = false;
  hardware.nvidia.dynamicBoost.enable = lib.mkForce true;
  boot.blacklistedKernelModules = [ "nouveau" ];
  systemd.services.nvidia-powerd.enable = true;



}
