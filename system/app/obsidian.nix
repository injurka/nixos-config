{ pkgs, ... }:

{
  # Obsidian
  environment.systemPackages = with pkgs; [
    obsidian
  ];
}