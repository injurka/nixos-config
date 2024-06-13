{ pkgs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.injurka = {
    isNormalUser = true;
    description = "injurka";
    extraGroups = [ "networkmanager" "input" "wheel" "video" "audio" "tss" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      tdesktop
      wget
    ];
  };

  programs.firefox.enable = true;
  programs.fish.enable = true;
  programs.direnv.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  environment.systemPackages = with pkgs; [
    vscode
    git
    vesktop
    neofetch
  ];

  system.stateVersion = "24.05";
}
