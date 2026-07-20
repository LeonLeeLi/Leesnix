{ pkgs, inputs, ... }:
{
  home.packages =
    (with pkgs; [
      vscode
      google-chrome
      devbox
      devenv
      qt6Packages.fcitx5-configtool
      claude-code
      codex
      qq
      wechat
      cherry-studio
      nixd
      nixfmt
      feishu
      nodejs
      osu-lazer-bin
      pear-desktop
      devenv
      lutris
      # bottles
      git-cola
      gitkraken
      detect-it-easy
      ov
      wl-clipboard
      obs-studio
      nh
      ventoy-full-gtk
      pear-desktop
      easyeffects
      fastfetch
      ncdu
      lmms-full
      yabridge
      yabridgectl
      hmcl
    ])
    ++ (with inputs.llm-agents.packages.x86_64-linux; [
      cc-switch-cli
      cli-proxy-api
    ]);

}
