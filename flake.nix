{
  description = "NixOS configuration for self-hosted apps";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        nixosConfigurations = {
          machine1 = pkgs.nixosSystem {
            system = "x86_64-linux";
            modules = [
              ./hosts/machine1/configuration.nix
              ./hosts/shared/common.nix
            ];
          };

          machine2 = pkgs.nixosSystem {
            system = "x86_64-linux";
            modules = [
              ./hosts/machine2/configuration.nix
              ./hosts/shared/common.nix
            ];
          };
        };
      });
}

