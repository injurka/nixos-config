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
    # ni
    nio="ni --prefer-offline";
    ni="ni";
    s="nr start";
    d="nr dev";
    b="nr build";
    bw="nr build --watch";
    t="nr test";
    tu="nr test -u";
    tw="nr test --watch";
    w="nr watch";
    p="nr play";
    c="nr typecheck";
    lint="nr lint";
    lintf="nr lint --fix";
    release="nr release";
    re="nr release";
    # git
    grt = "cd '$(git rev-parse --show-toplevel)'";
    gs = "git status";
    gp = "git push";
    gpf = "git push --force";
    gpft = "git push --follow-tags";
    gpl = "git pull --rebase";
    gcl = "git clone";
    gst = "git stash";
    grm = "git rm";
    gmv = "git mv";
    main = "git checkout main";
    gco = "git checkout";
    gcob = "git checkout -b";
    gb = "git branch";
    gbd = "git branch -d";
    grb = "git rebase";
    grbom = "git rebase origin/master";
    grbc = "git rebase --continue";
    gl = "git log";
    glo = "git log --oneline --graph";
    grh = "git reset HEAD";
    grh1 = "git reset HEAD~1";
    ga = "git add";
    gA = "git add -A";
    gc = "git commit";
    gcm = "git commit -m";
    gca = "git commit -a";
    gcam = "git add -A && git commit -m";
    gfrb = "git fetch origin && git rebase origin/master";
    gxn = "git clean -dn";
    gx = "git clean -df";
    gsha = "git rev-parse HEAD | pbcopy";
    ghci = "gh run list -L 1";
    gsw = "git switch";
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
        truncation_length = 10;
        truncate_to_repo = true;
        format = "[ $path]($style)[$read_only]($read_only_style) ";
        read_only = " ";
      };
      git_commit = {commit_hash_length = 7;};
      git_branch = {format = "[$symbol$branch]($style) ";};
      git_status = {
        conflicted = "[<](whiZte)=[$count](bright-white bold)[>](white)";
        ahead = "[<](white)⇡[$count](bright-white bold)[>](white)";
        behind = "[<](white)⇣[$count](bright-white bold)[>](white)";
        diverged = "[<](white)⇕⇡[$ahead_count](bright-white bold)⇣[$behind_count](bright-white)[>](white)";
        untracked = "[<](white)?[$count](bright-white bold)[>](white)";
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
          style = "fg:bright-gray";
          format = "[ $output ]($style)";
        };
        dir = {
          command = "echo  ";
          when = "[ \"$PWD\" != \"$HOME\" ]";
          shell = "[\"bash\",\"--norc\",\"--noprofile\"]";
          style = "fg:blue";
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
