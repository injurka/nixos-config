{ pkgs, ... }:
let
  myAliases = {
    vim = "nvim";
    cl = "clear";
    lgit = "lazygit";
    nswitch = "sudo nixos-rebuild switch --flake /etc/nixos";
    nswitchu = "sudo nixos-rebuild switch --flake /etc/nixos#nixos --update-input nixpkgs --commit-lock-file --upgrade";
    nau = "sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos";
    nsgc = "sudo nix-store --gc";
    ngc = "sudo nix-collect-garbage -d";
    ngc7 = "sudo nix-collect-garbage --delete-older-than 7d";
    ngc14 = "sudo nix-collect-garbage --delete-older-than 14d";
    node14 = "NIXPKGS_ALLOW_INSECURE=1 nix shell --impure nixpkgs/23.05#nodejs-14_x";
    node16 = "NIXPKGS_ALLOW_INSECURE=1 nix shell --impure nixpkgs/23.05#nodejs-16_x";
  };
in
{
  programs.fish = {
    enable = true;
    shellAliases = myAliases;
  };
  
  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = myAliases;
  };

  home.packages = with pkgs; [
    fishPlugins.done
    fishPlugins.fzf-fish
    fishPlugins.forgit
    fishPlugins.hydro
    fishPlugins.grc
    fzf
    grc
  ];
}
