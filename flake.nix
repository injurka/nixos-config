{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    
    home-manager = {
      # url = "github:nix-community/home-manager";
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };    
    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = inputs@{ self, catppuccin, anyrun, nixpkgs-unstable, ... }:
    let
      # ---- SYSTEM SETTINGS ---- #
      systemSettings = {
        system = "x86_64-linux";      # system arch
        hostname = "nixos";           # hostname
        profile = "personal";         # select a profile defined from my profiles directory
        timezone = "Europe/Moscow";   # select timezone
      };

      # ----- USER SETTINGS ----- #
      userSettings = rec {
        username = "injurka";         # username
        name = "Injurka";             # name/identifier
        email = "injurka@gmail.com";  # email (used for certain configurations)
        wm = "kde";                   # Selected window manager or desktop environment; must select one in both ./user/wm/ and ./system/wm/
      };

      lib = inputs.nixpkgs.lib;
      home-manager = inputs.home-manager;
      overlay-unstable = final: prev: {
        unstable = import nixpkgs-unstable {
          system = systemSettings.system;
          config.allowUnfree = true;
        };
      };
    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          modules = [
            catppuccin.nixosModules.catppuccin
            (./. + "/profiles" + ("/" + systemSettings.profile) + "/configuration.nix")
            ({ config, pkgs, ... }:
              {
                nixpkgs.overlays = [
                  overlay-unstable
                ];
              }
            )
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${userSettings.username} = {
                imports = [
                  (./. + "/profiles" + ("/" + systemSettings.profile) + "/home.nix")
                  catppuccin.homeManagerModules.catppuccin
                  anyrun.homeManagerModules.default
                ];
              };
              home-manager.extraSpecialArgs = {
                inherit systemSettings;
                inherit userSettings;
                inherit inputs;
              };
            }
          ];
          specialArgs = {
            inherit systemSettings;
            inherit userSettings;
            inherit inputs;
          };
        };
      };
    };
}
