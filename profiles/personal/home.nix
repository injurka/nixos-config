{ pkgs, userSettings, ... }:

{
  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;

  programs.home-manager.enable = true;

  imports = [ 
    ../../user/app/git.nix
    ../../user/app/keepass.nix
    ../../user/app/obsidian.nix
    ../../user/app/zoom.nix
    
    ../../user/shell/fish.nix

    ../../user/hardware/bluetooth.nix

    (./. + "../../../user/wm"+("/"+userSettings.wm+"/"+userSettings.wm)+".nix")
  ];

  home.packages = with pkgs; [    
    tdesktop
    syncthing
    vesktop
  ];

  home.stateVersion = "24.05";
}
