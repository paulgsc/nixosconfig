# hosts/machine1/configuration.nix
{ config, pkgs, ... }:

{
  imports = [
    ./shared/common.nix
    ./modules/metrics/metrics.nix
    ./modules/apps/nextjs-app.nix
    ./home.nix
  ];

  services.myNextJsApp.enable = true;
  services.prometheus.enable = true;
  services.nodeExporter.enable = true;
}
