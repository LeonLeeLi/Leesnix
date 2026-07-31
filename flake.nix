{
  description = "LeonLee's flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-2511.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    llm-agents = {
      url = "github:numtide/llm-agents.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    leespackage = {
      url = "github:LeonLeeLi/LeesNixPackage";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/";
    claude-desktop.url = "github:aaddrick/claude-desktop-debian";
    codex = {
      url = "github:ilysenko/codex-desktop-linux";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-2511,
      home-manager,
      nur,
      llm-agents,
      nix-index-database,
      nix-flatpak,
      leespackage,
      claude-desktop,
      codex,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      # 使用 nixos-25.11 的 lact（unstable 中 libdisplay-info 0.4.0 与 lact 打包的版本约束冲突）
      lactOverlay = final: prev: {
        lact = nixpkgs-2511.legacyPackages.${system}.lact;
      };
    in
    {
      nixosConfigurations.LeonLee = nixpkgs.lib.nixosSystem {
        modules = [
          ./configuration.nix
          ({ ... }: {
            nixpkgs.overlays = [
              nur.overlays.default
              lactOverlay
              claude-desktop.overlays.default
            ];
          })
          nix-flatpak.nixosModules.nix-flatpak
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
          nix-index-database.homeModules.default
          { programs.nix-index-database.comma.enable = true; }
        ];
      };

    };

}
