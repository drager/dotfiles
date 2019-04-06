{ config, pkgs, ... }:

{
  services.xserver = {
   # Enable X11.
   enable = true;

   # Keyboard options
   layout = "us, se";
   xkbOptions = "grp:alt_shift_toggle";
   
   #pkgs.xdm.enable = true;

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
   fonts = with pkgs; [
     terminus_font dejavu_fonts terminus_font_ttf
     #powerline-fonts
     nerdfonts
   ];
 };
}
