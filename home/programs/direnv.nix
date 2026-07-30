{ }: {
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true; # 启用针对 Nix 的快速缓存集成
  };
}
