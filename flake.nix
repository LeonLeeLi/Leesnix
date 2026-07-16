{
  description = "LeonLee's flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
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
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nur,
      llm-agents,

      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations.LeonLee = nixpkgs.lib.nixosSystem {
        modules = [
          ./configuration.nix
          ({ ... }: { nixpkgs.overlays = [ nur.overlays.default ]; })
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users.leonlee = ./home;
          }
        ];
      };

      homeConfigurations.leonlee = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
                ({ pkgs, ... }: {
          # 全局禁用 LLVM 测试（推荐写法）
          nixpkgs.overlays = [
            (final: prev: {
              llvmPackages = prev.llvmPackages // {
                llvm = prev.llvmPackages.llvm.overrideAttrs (old: {
                  doCheck = false;
                });
              };
            })
          ];
        })
        ];
      };
    };

}
