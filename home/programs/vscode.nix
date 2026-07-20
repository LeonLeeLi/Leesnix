{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      ms-ceintl.vscode-language-pack-zh-hans
      ms-python.python
      jnoortheen.nix-ide
      yzhang.markdown-all-in-one
      shd101wyy.markdown-preview-enhanced
    ];
  };
}
