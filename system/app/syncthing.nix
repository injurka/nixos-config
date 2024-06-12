{ pkgs, ... }:

{
  # Syncthing
  environment.systemPackages = with pkgs; [
    syncthing
  ];
  services.syncthing.enable = true;
}