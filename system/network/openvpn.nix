{ pkgs, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      openvpn = prev.openvpn.overrideAttrs (oldAttrs: {
        version = "2.6.9";
        src = prev.fetchurl {
          url = "https://swupdate.openvpn.org/community/releases/openvpn-2.6.9.tar.gz";
          sha256 = "1qyp2shjylzhvlgdrnm82yc5yjgi44gqlqfns7y8sl5l2mz193g0"; 
        };  
        buildInputs = oldAttrs.buildInputs ++ [ prev.openssl_legacy ];
      });
    })
  ];

  environment.systemPackages = with pkgs; [
    openssl_legacy
  ];
}


