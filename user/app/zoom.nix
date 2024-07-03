{ pkgs, ... }:

{
  home.packages = with pkgs; [
    pkgs.unstable.zoom-us
  ];
}