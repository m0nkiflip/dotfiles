{
  description = "Configuracion NixOS con Flakes + Mango";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    mangowc = {
      url = "github:mangowc/mangowc";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, mangowc, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hardware-configuration.nix
        ./configuration.nix
      ];
    };
  };
}
