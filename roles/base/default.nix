{ lib, ... }:
{
  lh = {
    cosmetic.stylix.enable = lib.mkDefault true;
    system.fhs-compat.enable = lib.mkDefault true;
    system.shell.enable = lib.mkDefault true;
    security.customca.enable = lib.mkDefault true;
    cosmetic.motd.enable = lib.mkDefault true;
  };
}
