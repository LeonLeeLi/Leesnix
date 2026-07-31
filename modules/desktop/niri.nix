{ pkgs, inputs, ... }:
{
  imports = [
    inputs.noctalia-greeter.nixosModules.default
  ];
  programs.niri.enable = true;
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;

  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
  };
}
