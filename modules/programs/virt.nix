{ ... }: {
  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = [ "leonlee" ];

  virtualisation.libvirtd.enable = true;

  virtualisation.spiceUSBRedirection.enable = true;

  virtualisation.incus.enable = true;

  users.users.leonlee.extraGroups = [ "incus-admin" ];

}
