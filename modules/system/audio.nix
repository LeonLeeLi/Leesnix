{ pkgs, config, ... }:
{
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    package = pkgs.pipewire;
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };
  services.pipewire.audio.enable =
    config.services.pipewire.alsa.enable
    || config.services.pipewire.jack.enable
    || config.services.pipewire.pulse.enable;
  hardware.firmware = [ pkgs.sof-firmware ];
  systemd.packages = [ pkgs.alsa-ucm-conf ];
}
