{ pkgs, config, ... }:
{
  hardware.enableAllFirmware = true;
  hardware.enableRedistributableFirmware = true;
  boot.kernelParams = [
    "snd-hda-intel.model=auto"
  ];
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;

  };

}
