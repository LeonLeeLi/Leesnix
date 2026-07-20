{ pkgs, config, ... }:
{
  hardware.enableAllFirmware = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
    jack.enable = true;
  };
  security.rtkit.enable = true;
  boot.kernelParams = [
    "snd_intel_dspcfg.dsp_driver=1"
  ];
}
