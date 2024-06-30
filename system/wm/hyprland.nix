{ userSettings, pkgs, ... }:

{
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.greetd.enableGnomeKeyring = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config.common.default = "*";
    extraPortals = with pkgs; [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-hyprland
    ];
  };

  services = {
    xserver = {
      enable = false;
      videoDrivers = [ "amdgpu" ];
      xkb = {
        layout = "us,ru";
        variant = "";
        options = "grp:win_space_toggle";
      };
    };  
    greetd = {
      enable = true;
      settings = {
        default_session = {
          user = userSettings.username;
          command = "Hyprland"; # start a wayland session directly without a login manager
        };
      };
    };
  };  

  services.displayManager = {
    autoLogin.user = userSettings.username;
    autoLogin.enable = true;
  };
  
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    enableHidpi = true;
    package = pkgs.sddm;
  };

  programs.hyprland = {
    enable = true;
  };
}