{ config, pkgs, lib,    ... }: 

{
  xdg.configFile = {
    "wallpapers" = {
      source = ../conf/wallpapers;
      recursive = true;
    };
  };

  systemd.user.services = {
    swaybg = {
      Unit = {
        Description = "Wallpaper chooser";
        PartOf = ["graphical-session.target"];
        After = ["graphical-session.target"];
      };
      Service = {
        ExecStart = "${lib.getExe pkgs.swaybg} -i ~/.config/wallpapers/balcony.png";
        Restart = "always";
      };
      Install = {
        WantedBy = ["graphical-session.target"];
      };
    };
  };
}
