{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (python312Full.withPackages(ps: with ps; [ pygobject3 gobject-introspection pyqt6-sip]))
    # nodejs_22.pkgs.pnpm
    nodejs_22
    nodejs_20
    nodejs_18
    bun
    yarn  
    pnpm
    corepack
  ];
}
