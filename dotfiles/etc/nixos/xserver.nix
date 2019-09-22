{ config, pkgs, ... }:

{
  services.xserver = {
   # Enable X11.
   enable = true;

   libinput = {
     enable = true;
     naturalScrolling = true;
   };

   # Keyboard options
   layout = "us, se";
   xkbOptions = "grp:alt_shift_toggle";
   
   #videoDrivers = [ "nvidia" ];

   #videoDrivers = [ "nvidiaLegacy940" ];

   resolutions = [ { x = 1920; y = 1080; } ];
   #resolutions = [ { x = 1920; y = 1080; } { x = 1920; y = 1200; } { x = 1920; y = 1200; } ];

   desktopManager.xterm.enable = false;

   xautolock = {
     enable = true;
     time = 10;
     locker = "${pkgs.slock}/bin/slock";
   };

   displayManager.lightdm = {
     enable = true;
     background = "#282828";
   #  greeters.mini = {
   #    enable = true;
   #    user = "drager";
   #    extraConfig = ''
   #        [greeter]
   #        show-password-label = false
   #
   #        [greeter-theme]
   #        background-color = "#282828"
   #        password-background-color = "#FFFFFF"
   #    '';
   #  };
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

    windowManager = {
      default = "awesome";
      awesome.enable = true;
    };
  };

  fonts = {
   enableFontDir = true;
   fonts = with pkgs; [
     terminus_font dejavu_fonts terminus_font_ttf
     powerline-fonts roboto
     nerdfonts font-awesome_5
   ];
  };
}
