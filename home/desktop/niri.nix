{ inputs, pkgs, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];
  programs.noctalia = {
    enable = true;
    systemd.enable = true;
    # theme 不在这里手动配置:stylix 开启后会通过它内置的 noctalia target
    # 自动接管 theme.source/mode/调色板,使 noctalia 与系统 Catppuccin Mocha
    # 配色保持一致。手动设置 theme.source 会与 stylix 的默认值冲突。
  };
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
}
