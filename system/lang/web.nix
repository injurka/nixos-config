{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pkgs.nodePackages."@antfu/ni"
    nodejs_22
    nodejs_20
    nodejs_18
    bun
    yarn  
    # pnpm
    nodePackages.pnpm 
    corepack
  ];
}
