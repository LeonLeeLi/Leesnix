{ pkgs, ... }: {
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services = {
    login.enableKwallet = true;
    sddm.enableKwallet = true;
    leonlee = {
      kwallet = {
        enable = true;
        package = pkgs.kdePackages.kwallet-pam; # 使用 Plasma 6 的 PAM 模块
      };
    };
  };
  services.dbus.enable = true;
  services.dbus.packages = [ pkgs.kdePackages.kwallet ];

}
