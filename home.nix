{ config, pkgs, ... }:

{
  # 注意修改这里的用户名与用户目录
  home.username = "leonlee";
  home.homeDirectory = "/home/leonlee";


  home.packages = with pkgs;[
    vscode
    google-chrome
    devbox
  ];
  systemd.user.enable=true;

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      ms-ceintl.vscode-language-pack-zh-hans
      ms-python.python
      bbenoist.nix
      jnoortheen.nix-ide
    ];
  };

  home.stateVersion = "26.05";
}
