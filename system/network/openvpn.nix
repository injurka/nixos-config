{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    networkmanager-openvpn
    openvpn
    openssl
  ];
}


