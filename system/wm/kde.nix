{ userSettings, pkgs, ... }:

{
   services.displayManager = {
    sddm.enable = true;
    autoLogin.user = userSettings.username;
    autoLogin.enable = true;
  };

  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
    xkb.layout = "us,ru";
    xkb.variant = "";
    xkb.options = "grp:win_space_toggle";
  };

  services.desktopManager.plasma6.enable = true;

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    oxygen
    kate
  ];

  environment.systemPackages = with pkgs.kdePackages; [
    qtstyleplugin-kvantum
  ];
}
