{ config, pkgs, lib,... }:
{

  imports = [
    ./hardware-configuration.nix
    ./modules/system
    ./modules/desktop
    ./modules/services
    ./modules/programs
    ./modules/virtualisation
    ./modules/users
    ./modules/environment.nix
    ./modules/state.nix
  ];
  
   # ============================================
  # 🔥 暴力跳过所有能跳过的
  # ============================================
  # ① 普通 C/Go/Rust 包：跳过测试
  nixpkgs.config.doCheckByDefault = false;
  # ② 允许被标记为 "broken" 的包继续构建
  nixpkgs.config.allowBroken = true;
  # ③ 允许 "unsupported" 的平台
  nixpkgs.config.allowUnsupportedSystem = true;
  # ④ Python 包：用 overlay 全局跳过测试（这是关键！）
  nixpkgs.overlays = [
    (final: prev: {
      python3 = prev.python3.override {
        packageOverrides = pyFinal: pyPrev:
          lib.mapAttrs
            (name: pkg:
              # 只对 Python 包（排除解释器本身）
              if lib.isDerivation pkg && pkg ? overridePythonAttrs
              then pkg.overridePythonAttrs (_: { doCheck = false; })
              else pkg
            )
            pyPrev;
      };
    })
  ];
}
