{ userSettings, pkgs, ... }:

{
  home.packages = with pkgs; [    
    vscode
  ];
}