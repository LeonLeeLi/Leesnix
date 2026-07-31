{ inputs, pkgs, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];
  programs.niri.enable = true;
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
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  home.packages = (
    with pkgs;
    [
      kdePackages.dolphin
      kdePackages.konsole
      fuzzel
      alacritty
      swaylock
    ]
  );
  services.gnome.gnome-keyring.enable = true;
}
