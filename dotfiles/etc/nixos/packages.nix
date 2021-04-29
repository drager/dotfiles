{ config, lib, pkgs, stdenv, ... }:

{
  nixpkgs.config.allowUnfreePredicate = pkg:
    pkgs.lib.elem (builtins.parseDrvName pkg.name).name
    [ "firefox-bin" "vscode" "google-chrome" "mongodb-compass" ];

  programs.adb.enable = true;
  programs.slock.enable = true;

  nixpkgs.config.packageOverrides = pkgs: rec {
    my-firefox-dev = pkgs.stdenv.mkDerivation {
	  name = "firefox-devedition-bin";
	  src = pkgs.firefox-devedition-bin;
	  phases = [ "buildPhase" ];
	  buildPhase = ''
	    mkdir -vp $out/bin
	    mkdir -vp $out/share/applications
	    mkdir -vp $out/share/icons/hicolor/16x16/apps
	    mkdir -vp $out/share/icons/hicolor/32x32/apps
	    mkdir -vp $out/share/icons/hicolor/48x48/apps
	    mkdir -vp $out/share/icons/hicolor/64x64/apps
	    mkdir -vp $out/share/icons/hicolor/128x128/apps
	    ln -vs ${pkgs.firefox-devedition-bin}/bin/firefox-devedition $out/bin/firefox-devedition
	    ln -vs ${pkgs.firefox-devedition-bin}/share/applications/firefox.desktop $out/share/applications/firefox-dev.desktop
	    ln -vs ${pkgs.firefox-devedition-bin}/share/icons/hicolor/16x16/apps/firefox.png $out/share/icons/hicolor/16x16/apps/firefox-dev.png
	    ln -vs ${pkgs.firefox-devedition-bin}/share/icons/hicolor/32x32/apps/firefox.png $out/share/icons/hicolor/32x32/apps/firefox-dev.png
	    ln -vs ${pkgs.firefox-devedition-bin}/share/icons/hicolor/48x48/apps/firefox.png $out/share/icons/hicolor/48x48/apps/firefox-dev.png
	    ln -vs ${pkgs.firefox-devedition-bin}/share/icons/hicolor/64x64/apps/firefox.png $out/share/icons/hicolor/64x64/apps/firefox-dev.png
	    ln -vs ${pkgs.firefox-devedition-bin}/share/icons/hicolor/128x128/apps/firefox.png $out/share/icons/hicolor/128x128/apps/firefox-dev.png
	  '';
    };
    rofi = pkgs.rofi.override { plugins = [ pkgs.rofi-calc ]; };
  };

  environment = with pkgs; {
    systemPackages = [
      # Tools and utilities.
      mkpasswd wget curl git xclip theme-vertex file
      unzip zip ranger keychain system-config-printer fzf killall xorg.xbacklight
      tldr htop hardinfo glxinfo tree ripgrep conky yad xdotool dnsutils

      # Themeing, greeter.
      numix-gtk-theme numix-icon-theme blueman lxappearance compton
      #gtk #gnome.gnomeicontheme

      # Languages and programming tools.
      #nodejs-10_x #yarn
      rustup-1-22.rustup
      android-studio-3-4-0.android-studio

      # Editors.
      neovim vim vscode

      # Terminal and WM.
      kitty awesome lightlocker
      rofi
      antibody alacritty 
      polybar xmobar lemonbar

      # Browsers.
      firefox my-firefox-dev
      google-chrome

      # Others
      weechat gimp feh slack apvlv postman-7-6-0.postman libreoffice
      gcc wineWowPackages.stable  dbeaver pavucontrol mitmproxy arandr
      nssmdns kubectl minikube-1-2-0.minikube mongodb-compass docker-compose
      tk alsaLib xorg.libX11 godot-3-2-3.godot
      teams
      #skypeforlinux
      steam
      llvmPackages.libclang
      clang
      rust-analyzer-latest.rust-analyzer
    ];
  };
}
