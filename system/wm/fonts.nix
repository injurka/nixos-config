{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    iosevka
    maple-mono
    font-awesome
    jetbrains-mono
    (nerdfonts.override {fonts = ["Iosevka" "JetBrainsMono"];})
  ];
  fonts.fontDir.enable = true;
}
