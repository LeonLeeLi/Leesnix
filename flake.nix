{
  description = "LeonLee's flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    llm-agents = {
      url = "github:numtide/llm-agents.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    leesnix = {
      url = "github:leonleeli/LeesNixPackage";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, home-manager, nur, llm-agents, ... }@inputs: {
      nixosConfigurations.LeonLee = nixpkgs.lib.nixosSystem {
        modules = [
          ./configuration.nix
          ({...}:{nixpkgs.overlays = [ nur.overlays.default ];})
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.leonlee = ./home;
          }
        ];
      };
    };


}
