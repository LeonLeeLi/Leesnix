{ lib, ... }:
{
  nix.settings.accept-flake-config = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.settings.substituters = [
    "https://mirrors.ustc.edu.cn/nix-channels/store"
    "https://cache.nixos.org/"
    "https://noctalia.cachix.org"
  ];
  nix.settings.trusted-public-keys = [
    "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowInsecurePredicate = _: true;
}
