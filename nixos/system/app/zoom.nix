{ pkgs, ... }:

{
  # Zoom
  environment.systemPackages = with pkgs; [
    zoom
  ];
}