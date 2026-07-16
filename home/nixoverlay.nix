{
  config,
  lib,
  pkgs,
  ...
}:
{
  nixpkgs.overlays = [
    (final: prev: {
      patool = prev.patool.overridePythonAttrs (oldAttrs: {
        doCheck = false; 
      });
    })
  ];
}
