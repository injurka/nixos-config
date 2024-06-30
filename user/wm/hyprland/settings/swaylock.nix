{ config, pkgs, ... }: 

{
  programs.swaylock = {
    enable = true;
    catppuccin.enable = false;
    settings = {
      clock = true;
      color = "191724";
      font = "Maple Mono";
      image = "~/.config/wallpapers/balcony.png";
      show-failed-attempts = false;
      indicator = true;
      indicator-radius = 200;
      indicator-thickness = 20;
      line-color = "00000000";
      ring-color = "00000000";
      inside-color = "00000000";
      key-hl-color = "f2cdcd";
      separator-color = "00000000";
      text-color = "e0def4";
      text-caps-lock-color = "";
      line-ver-color = "eb6f92";
      ring-ver-color = "ebbcba";
      inside-ver-color = "191724";
      text-ver-color = "e0def4";
      ring-wrong-color = "9ccfd8";
      text-wrong-color = "9ccfd8";
      inside-wrong-color = "191724";
      inside-clear-color = "191724";
      text-clear-color = "e0def4";
      ring-clear-color = "c4a7e7";
      line-clear-color = "191724";
      line-wrong-color = "191724";
      bs-hl-color = "9ccfd8";
      line-uses-ring = false;
      grace = 2;
      grace-no-mouse = true;
      grace-no-touch = true;
      datestr = "%d.%m";
      fade-in = "0.1";
      ignore-empty-password = true;
    };
  };
}
