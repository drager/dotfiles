{ config, pkgs, ... }:

{
  services.xserver = {
   # Enable X11.
   enable = true;

   libinput = {
     enable = true;
     naturalScrolling = false;
   };

   # Keyboard options
   layout = "us, se";
   xkbOptions = "grp:alt_shift_toggle";
   
   xautolock = {
     enable = true;
     time = 10;
     locker = "${pkgs.slock}/bin/slock";
   };

   displayManager.lightdm = {
     enable = true;
     greeters.gtk = {
       enable = true;
       indicators = [ "~spacer" "~clock" "~power" ];
       theme.name = "Vertex-Dark";
       iconTheme.name = "Numix";
       iconTheme.package = pkgs.numix-icon-theme;
       theme.package = pkgs.theme-vertex;
       extraConfig = ''
            xft-antialias=true
            hide-user-image=true
            font-name=DejaVu Sans
            #font-name=Lat2-Terminus-16
       '';
     };
  };

  displayManager.defaultSession = "xfce+awesome";
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
    };

    windowManager.awesome = {
      enable = true;
    };

  };

  fonts = {
   fontDir.enable = true;
   fonts = with pkgs; [
      noto-fonts material-icons terminus font-awesome
   ];

   fontconfig.allowBitmaps = true;
  };
}
