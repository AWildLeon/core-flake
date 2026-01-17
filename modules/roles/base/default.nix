{ lib, config, ... }:
let
  cfg = config.lh.roles.base;
in
{
  options.lh.roles.base = {
    enable = lib.mkEnableOption "Enable Base Role";
  };

  config = lib.mkIf cfg.enable {
    lh = {
      security.hardenProc = lib.mkDefault true;
      cosmetic.stylix.enable = lib.mkDefault true;
      system.fhs-compat.enable = lib.mkDefault true;
      system.shell.enable = lib.mkDefault true;
      security.customca.enable = lib.mkDefault true;
      cosmetic.motd.enable = lib.mkDefault true;
    };
  };
}
