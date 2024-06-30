{ config, pkgs, ... }: 

{
  imports = [
    ../../terminal/kitty.nix
    ../../app/anyrun.nix
    ./settings/swaybg.nix
    ./settings/swaylock.nix
    ./settings/gtk.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    settings = {
      env = [
        "NIXOS_OZONE_WL,1" # for any ozone-based browser & electron apps to run on wayland
        "MOZ_ENABLE_WAYLAND,1" # for firefox to run on wayland
        "MOZ_WEBRENDER,1"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_QPA_PLATFORM,wayland"
        "SDL_VIDEODRIVER,wayland"
        "GDK_BACKEND,wayland"
      ];
    };
    systemd.enable = true;
    extraConfig = builtins.readFile ./conf/hyprland.conf; 
  };

  home.packages = (with pkgs; [
    waybar # the status bar
    swaybg # the wallpaper
    swayidle # the idle timeout
    swaylock # locking the screen
    wlogout # logout menu
    wl-clipboard # copying and pasting
    hyprpicker # color picker

    hyprshot # screen shot
    grim # taking screenshots
    slurp # selecting a region to screenshot

    mako # the notification daemon, the same as dunst

    yad # a fork of zenity, for creating dialogs

    networkmanagerapplet # provide GUI app: nm-connection-editor
  
    gnome.gnome-system-monitor  
  ]);

  xdg.configFile = {
    "hypr/mako" = {
      source = ./conf/mako;
      recursive = true;
    };
    "hypr/scripts" = {
      source = ./conf/scripts;
      recursive = true;
    };
    "hypr/waybar" = {
      source = ./conf/waybar;
      recursive = true;
    };
    "hypr/wlogout" = {
      source = ./conf/wlogout;
      recursive = true;
    };
  };

  programs.firefox = {
    enable = true;
    enableGnomeExtensions = false;
    package = pkgs.firefox-wayland; # firefox with wayland support
  };

  programs.vscode = {
    enable = true;
    # let vscode sync and update its configuration & extensions across devices, using github account.
    userSettings = {};
    package =
      (pkgs.vscode.override
        {
          isInsiders = false;
          # https://wiki.archlinux.org/title/Wayland#Electron
          commandLineArgs = [
            "--ozone-platform-hint=auto"
            "--ozone-platform=wayland"
            # make it use GTK_IM_MODULE if it runs with Gtk4, so fcitx5 can work with it.
            # (only supported by chromium/chrome at this time, not electron)
            "--gtk-version=4"
            # make it use text-input-v1, which works for kwin 5.27 and weston
            "--enable-wayland-ime"

            # TODO: fix https://github.com/microsoft/vscode/issues/187436
            # still not works...
            "--password-store=gnome" # use gnome-keyring as password store
          ];
      });
  };
}
