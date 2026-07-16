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
      bottles
      cherry-studio
      nixd
      nixfmt
      feishu
      nodejs
      nix-index
      osu-lazer-bin
      pear-desktop
    ])
    ++ (with inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}; [
      cc-switch-cli
    ]);

}
