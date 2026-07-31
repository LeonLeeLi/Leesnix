{ ... }:
{
  programs.niri.enable = true;
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true;
    systemd.enable = true;
  };
}
