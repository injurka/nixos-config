{ pkgs, ... }:

{
  # KDE
  services.desktopManager.plasma6.enable = true;
  
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    oxygen
  ];

  environment.systemPackages = with pkgs.kdePackages; [
    qtstyleplugin-kvantum
  ];
}
