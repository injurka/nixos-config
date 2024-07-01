{ pkgs, ... }:
let
  myAliases = {
    vim = "nvim";
    cl = "clear";
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

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    settings = {
      add_newline = false;
      command_timeout = 1000;
      scan_timeout = 10;
      character = {
        success_symbol = "[›](#89b4fa)";
        error_symbol = "[›](red)";
      };
      directory = {
        truncation_length = 1;
        format = "[ $path ]($style)[$read_only]($read_only_style) ";
        style = "fg:white bg:black bold";
        read_only = "  ";
        read_only_style = "fg:black bg:red";
      };
      git_commit = {commit_hash_length = 7;};
      git_branch = {format = "[$symbol$branch]($style) ";};
      git_status = {
        conflicted = "[<](white)=[$count](bright-white bold)[>](white)";
        ahead = "[<](white)⇡[$count](bright-white bold)[>](white)";
        behind = "[<](white)⇣[$count](bright-white bold)[>](white)";
        diverged = "[<](white)⇕⇡[$ahead_count](bright-white bold)⇣[$behind_count](bright-white)[>](white)";
        untracked = "[<](white)?[$count](bright-white bold)[>](white)";
        stashed = "[<](white)$[$count](bright-white bold)[>](white)";
        modified = "[<](white)![$count](bright-white bold)[>](white)";
        staged = "[<](white)+[$count](bright-white bold)[>](white)";
        renamed = "[<](white)»[$count](bright-white bold)[>](white)";
        deleted = "[<](white)✗[$count](bright-white bold)[>](white)";
      };
      custom = {
        home_dir = {
          command = "echo  ";
          when = "[ \"$PWD\" == \"$HOME\" ]";
          shell = "[\"bash\",\"--norc\",\"--noprofile\"]";
          style = "fg:bright-white bg:bright-black";
          format = "[ $output ]($style)";
        };
        dir = {
          command = "echo  ";
          when = "[ \"$PWD\" != \"$HOME\" ]";
          shell = "[\"bash\",\"--norc\",\"--noprofile\"]";
          style = "fg:blue bg:bright-black";
          format = "[ $output ]($style)";
        };
        git_host = {
          command = "getgithost";
          when = "git rev-parse --is-inside-work-tree 2> /dev/null";
          shell = "[\"bash\",\"--norc\",\"--noprofile\"]";
          style = "bright-yellow bold";
          format = "at [$output]($style)";
        };
      };
      line_break.disabled = false;
      hostname = {
        ssh_only = true;
        format = "[$hostname](bold blue) ";
        disabled = false;
      };
    };
  };
}
