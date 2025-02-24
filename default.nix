# In /etc/nixos/my-nixfiles/default.nix
{ lib, ... }:

{
  imports = [
    ./system.nix
    ./home.nix
  ];

  options = {
    nova.xrdp.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable or disable XRDP service";
    };
  };
}