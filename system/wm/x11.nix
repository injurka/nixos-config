{ userSettings, ... }:

{
  services.displayManager = {
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
}
