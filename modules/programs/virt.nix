{ ... }: {
  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = [ "leonlee" ];

  virtualisation.libvirtd.enable = true;

  virtualisation.spiceUSBRedirection.enable = true;

}
