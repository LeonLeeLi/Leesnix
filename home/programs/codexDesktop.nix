{ inputs, ... }: {
  imports = [
    inputs.codex.homeManagerModules.default
  ];

  programs.codexDesktopLinux = {
    enable = true;
    computerUseUi.enable = true;
    remoteMobileControl.enable = true;
    linuxFeatures = [
      "appshots"
      "open-target-discovery"
    ];
    remoteControl.enable = true;
  };
}
