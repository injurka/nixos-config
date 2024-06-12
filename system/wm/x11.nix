{ ... }:

{
  # X11
  services.displayManager = {
    sddm.enable = true;
    autoLogin.user = "injurka";
    autoLogin.enable = true;
  };

  services.xserver = {
    enable = true;
    xkb.layout = "us,ru";
    xkb.variant = "";
    # xkb.options = "grp:win_space_toggle";
    xkb.options = "grp:alt_shift_toggle";
  };
}
