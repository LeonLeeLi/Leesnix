
{ config, pkgs, ... }:

{
  imports =
    [  
      ./hardware-configuration.nix
    ];

  hardware.bluetooth.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.substituters = [ "https://mirrors.ustc.edu.cn/nix-channels/store" "https://cache.nixos.org/" ];


  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "LeonLee"; # Define your hostname.


  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Shanghai";

  i18n.defaultLocale = "zh_CN.UTF-8";
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      waylandFrontend = true;
      addons = [
        (pkgs.fcitx5-rime.override {
          rimeDataPkgs = [ pkgs.rime-ice ];
        })
      ];
    };
  };


  i18n.extraLocaleSettings = {
    LC_ADDRESS = "zh_CN.UTF-8";
    LC_IDENTIFICATION = "zh_CN.UTF-8";
    LC_MEASUREMENT = "zh_CN.UTF-8";
    LC_MONETARY = "zh_CN.UTF-8";
    LC_NAME = "zh_CN.UTF-8";
    LC_NUMERIC = "zh_CN.UTF-8";
    LC_PAPER = "zh_CN.UTF-8";
    LC_TELEPHONE = "zh_CN.UTF-8";
    LC_TIME = "zh_CN.UTF-8";
  };


  services.xserver.enable = true;

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  environment.variables.EDITOR = "nano";

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };


  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

  };

  users.users.leonlee = {
    isNormalUser = true;
    description = "Leon Lee";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate

    ];
  };

  programs.firefox.enable = true;

  programs.steam = {
  enable = true;
};


  nixpkgs.config.allowUnfree = true;


  environment.systemPackages = with pkgs; [
    wget
    git
    pkgs.noto-fonts-cjk-sans
    ntfs3g
  ];

  nixpkgs.config.permittedInsecurePackages = [
    "pnpm-10.29.2"
  ];  


  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    #配置权限
    polkitPolicyOwners = [ "leonlee" ];
  };


  programs.throne = {
    enable = true;
    tunMode.enable = true;
  };

  # 虚拟机
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;

  users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];

  system.stateVersion = "26.05";

}
