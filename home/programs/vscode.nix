{ pkgs, inputs, ... }:
{
  programs.vscode = {
    enable = true;
    extensions =
      (with pkgs.vscode-extensions; [
        ms-ceintl.vscode-language-pack-zh-hans
        ms-python.python
        jnoortheen.nix-ide
        yzhang.markdown-all-in-one
        shd101wyy.markdown-preview-enhanced
        alefragnani.project-manager
        ms-python.python
        golang.go
      ])
      ++ (with inputs.leespackage.vscode-extensions; [
        jetpack-io.devbox
      ]);
  };

  # 不让 stylix 声明式接管 VSCode 的 settings.json。否则该文件会变成
  # 指向只读 nix store 的符号链接,导致无法在 GUI 里修改任何设置。
  # 字体/主题等设置改由 settings.json 手动维护。
  stylix.targets.vscode.enable = false;
}
