if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias cl="clear"
alias lgit="lazygit"
alias nswitch="sudo nixos-rebuild switch --flake /etc/nixos"
alias nswitchu="sudo nixos-rebuild switch --flake /etc/nixos#nixos --update-input nixpkgs --commit-lock-file --upgrade"
alias nau="sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos"
alias nsgc="sudo nix-store --gc"
alias ngc="sudo nix-collect-garbage -d"`
alias ngc7="sudo nix-collect-garbage --delete-older-than 7d"
alias ngc14="sudo nix-collect-garbage --delete-older-than 14d"

alias node14="NIXPKGS_ALLOW_INSECURE=1 nix shell --impure nixpkgs/23.05#nodejs-14_x"
alias node16="NIXPKGS_ALLOW_INSECURE=1 nix shell --impure nixpkgs/23.05#nodejs-16_x"

set fish_vi_force_cursor
set fish_cursor_default block
set fish_cursor_insert line blink
set fish_cursor_visual underscore blink

set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"

starship init fish | source
direnv hook fish | source
