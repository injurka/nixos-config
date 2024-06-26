{ pkgs, userSettings, ... }:

{
  home.packages = [ 
    pkgs.git 
  ];

  programs.git.enable = true;
  programs.git.userName = userSettings.username;
  programs.git.userEmail = userSettings.username+"@gmail.com";
  programs.git.extraConfig = {
    init.defaultBranch = "main";
  };
}
