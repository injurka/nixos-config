{
  description = "XNM's NixOS Configuration";

  inputs = {
      nixpkgs-stable.url = "nixpkgs/nixos-24.05";

      # home-manager-stable.url = "github:nix-community/home-manager/release-24.05";
      # home-manager-stable.inputs.nixpkgs.follows = "nixpkgs-stable";
  };

  outputs = { nixpkgs, ... } @ inputs:
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { 
        inherit inputs; 
      };
      modules = [
        ./profiles/personal/configuration.nix

        ./system/hardware-configuration.nix
        ./system/hardware/bluetooth.nix
        ./system/hardware/bootloader.nix
        ./system/hardware/internationalisation.nix
        ./system/hardware/nix-settings.nix
        ./system/hardware/programming-languages.nix
        ./system/hardware/time.nix

        ./system/network/networking.nix
        ./system/network/openvpn.nix
        
        ./system/wm/x11.nix
        ./system/wm/kde.nix
        ./system/wm/sound.nix
        ./system/wm/dbus.nix
        ./system/wm/fonts.nix

        ./system/app/zoom.nix
        ./system/app/syncthing.nix
        # ./system/app/docker.nix
      ];
    };
  };
}