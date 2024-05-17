# hosts/shared/common.nix
{ config, pkgs, ... }:

{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 80 443 ];
  };

  networking.interfaces.enp0s3.ipv4.addresses = [
    {
      address = "192.168.1.100";
      prefixLength = 24;
    }
  ];
}

