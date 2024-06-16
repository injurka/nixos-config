{ pkgs, ... }:

{
  services.desktopManager.plasma6.enable = true;
  services.displayManager = {
    sddm.enable = true;
  };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    oxygen
    kate
  ];

  environment.systemPackages = with pkgs.kdePackages; [
    qtstyleplugin-kvantum
  ];
}
