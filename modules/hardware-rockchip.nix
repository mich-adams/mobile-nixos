{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.mobile.hardware.socs;
in
{
  options.mobile = {
    hardware.socs.rockchip-op1.enable = mkOption {
      type = types.bool;
      default = false;
      description = "enable when SOC is RK3399-OP1";
    };
  };

  config = mkMerge [
    {
      mobile = mkIf cfg.rockchip-op1.enable {
        system.platform = "aarch64-linux";
      };
    }
  ];
}
