{ pkgs, lib, systemSettings, userSettings, ... }:

{
  imports = [ 
    ../../system/hardware-configuration.nix
    ../../system/hardware/bluetooth.nix
    ../../system/hardware/bootloader.nix
    ../../system/hardware/internationalisation.nix
    ../../system/hardware/nix-settings.nix
    ../../system/hardware/time.nix

    ../../system/network/networking.nix
    ../../system/network/openvpn.nix
    
    (./. + "../../../system/wm"+("/"+userSettings.wm)+".nix")
    ../../system/wm/sound.nix
    ../../system/wm/dbus.nix
    ../../system/wm/fonts.nix

    ../../system/lang/web.nix
    ../../system/lang/cc.nix
    ../../system/lang/python.nix

    ../../system/app/syncthing.nix
    ../../system/app/ssh.nix
    ../../system/app/ollama.nix
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = userSettings.name;
    extraGroups = [ "networkmanager" "input" "wheel" "video" "audio" "tss" ];
    shell = pkgs.fish;
  };

  programs.firefox.enable = true;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    git
    wget
    neofetch
    home-manager
    starship  
  ];


  system.stateVersion = "24.05";
}
