{ pkgs, ... }:
{
  users.users.leonlee = {
    isNormalUser = true;
    description = "Leon Lee";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };
}
