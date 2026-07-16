{ ... }:
{

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;
  hardware.nvidia.nvidiaSettings = true;
  hardware.nvidia.nvidiaPersistenced = true;
  hardware.nvidia.powerManagement.enable = true;
  boot.kernelParams = [ "modprobe.blacklist=nouveau" ];

}
