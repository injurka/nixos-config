{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    python3Full
    imath
    pystring
  ];
}
