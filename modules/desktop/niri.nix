{ ... }:
{
  programs.niri.enable = true;
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  # noctalia 在 home 层 (home/desktop/niri.nix) 启用,避免 theme.source
  # 在 NixOS 层和 home 层重复定义导致冲突。
}
  # 系统层开启 stylix。必须在这里 enable,stylix 才会把它的 home-manager
  # 模块通过 home-manager.sharedModules 自动注入到每个用户下,从而使
  # home-manager.users.<name>.stylix 选项存在。
  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    
  };
}