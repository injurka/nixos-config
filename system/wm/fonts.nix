{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    iosevka
    maple-mono-NF
    font-awesome
    nerd-font-patcher
  ];
  fonts.fontDir.enable = true;
}
