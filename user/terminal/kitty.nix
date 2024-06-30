{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    kitty
  ];

  programs.kitty = {
    enable = true;
    font = {
      name = "Maple Mono";
      size = 14;
    };

    catppuccin.enable = true;

    settings = {
      window_padding_width = 12;
      background_opacity = "0.8";
    };
  };
}
