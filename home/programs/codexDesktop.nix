{ inputs, ... }: {
  imports = [
    inputs.codex-desktop-linux.homeManagerModules.default
  ];

  programs.codexDesktopLinux = {
    enable = true;
    computserUseUi.enable = true;
    remoteMobileControl.enable = true;
    linuxFeatures = [
      "appshots"
      "open-target-discovery"
    ];
    remoteControl.enable = true;
  };
}
