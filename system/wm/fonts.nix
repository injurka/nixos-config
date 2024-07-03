{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    iosevka
    maple-mono
    font-awesome
    jetbrains-mono

    material-icons
    material-design-icons
    roboto
    work-sans
    comic-neue
    source-sans
    twemoji-color-font
    comfortaa
    inter
    lato
    lexend
    jost
    dejavu_fonts
      
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji

    (nerdfonts.override {fonts = ["Iosevka" "JetBrainsMono"];})
  ];
  fonts.fontDir.enable = true;
}
