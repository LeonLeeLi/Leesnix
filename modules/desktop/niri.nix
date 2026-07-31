{ inputs, pkgs, ... }:
{
  programs.niri.enable = true;
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  imports = [
    inputs.noctalia.nixosModules.default
    inputs.noctalia-greeter.nixosModules.default
  ];
  programs.noctalia = {
    enable = true;
    systemd.enable = true;
    settings = {
      # This may also be a string or path to a .toml file.
      theme = {
        mode = "dark";
        source = "builtin";
        builtin = "Catppuccin";
      };
      programs.noctalia.systemd.enable = true;
      # wallpaper = {
      #   enabled = true;
      #   default.path = "/path/to/wallpapers/wallpaper.png";
      # };
    };
  };
  programs.noctalia-greeter.settings = {
    cursor = {
      theme = "Bibata-Modern-Ice";
      size = 24;
      path = "${pkgs.bibata-cursors}/share/icons";
    };
  };
  environment.systemPackages = with pkgs; [
    kdePackages.dolphin
    kdePackages.konsole
    fuzzel
    alacritty
    swaylock
  ];
}
