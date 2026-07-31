{ ... }:
{
  programs.niri.enable = true;
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  # noctalia 在 home 层 (home/desktop/niri.nix) 启用,避免 theme.source
  # 在 NixOS 层和 home 层重复定义导致冲突。
}
