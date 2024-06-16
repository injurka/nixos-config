{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, ... }:
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

    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          modules = [
            (./. + "/profiles" + ("/" + systemSettings.profile) + "/configuration.nix")
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${userSettings.username} = import (./. + "/profiles" + ("/" + systemSettings.profile) + "/home.nix");
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
