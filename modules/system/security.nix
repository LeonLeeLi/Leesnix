{ pkgs, ... }: {
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.login.enableGnomeKeyring = true;
  security.pam.services.sddm.enableGnomeKeyring = true;
  environment.variables.XDG_RUNTIME_DIR = "/run/user/1000";

}
