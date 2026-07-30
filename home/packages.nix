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
      git-cola
      gitkraken
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
      prismlauncher
      localsend
      ariang
      uv
      opencode
      opencode-desktop
      claude-desktop
      reaper
      yabridge
      musescore
    ])
    ++ (with inputs.llm-agents.packages.x86_64-linux; [
      cc-switch-cli
      cli-proxy-api
    ])
    ++ (with inputs.leespackage.packages.x86_64-linux; [
      zcode
    ]);
}
