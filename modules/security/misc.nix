{ lib, ... }:
{
  security.sudo.enable = lib.mkDefault false;
  environment.defaultPackages = lib.mkForce [ ];
  systemd.coredump.enable = lib.mkDefault false;
}
