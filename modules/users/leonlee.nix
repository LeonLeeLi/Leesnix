{ pkgs, ... }:
{
  users.users.leonlee = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "Leon Lee";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };
}
