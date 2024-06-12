{ pkgs, ... }:
{
  # Fonts
  fonts.packages = with pkgs; [
    iosevka
    maple-mono-NF
  ];
  fonts.fontDir.enable = true;
}