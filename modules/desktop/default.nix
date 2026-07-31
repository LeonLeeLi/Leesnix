{ pkgs, ... }:
{
  imports = [
    ./niri.nix
  ];

  # 系统层开启 stylix。必须在这里 enable,stylix 才会把它的 home-manager
  # 模块通过 home-manager.sharedModules 自动注入到每个用户下,从而使
  # home-manager.users.<name>.stylix 选项存在。
  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
  };
}
