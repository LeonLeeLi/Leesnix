{ pkgs, inputs, ... }:
{
  home.packages =
    (with pkgs; [
      vscode
      google-chrome
      devbox
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
    ])
    ++ (with inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}; [
      cc-switch-cli
    ]);

}
