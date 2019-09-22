{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfreePredicate = pkg:
    pkgs.lib.elem (builtins.parseDrvName pkg.name).name
    [ "firefox-bin" "vscode" "google-chrome" "skypeforlinux" "mongodb-compass" ];

  programs.adb.enable = true;
  programs.slock.enable = true;

  environment = with pkgs; {
    systemPackages = [
      # Tools and utilities.
      mkpasswd wget curl git xclip theme-vertex file
      unzip zip ranger keychain system-config-printer fzf
      tldr htop hardinfo glxinfo tree

      # Themeing, greeter.
      numix-gtk-theme numix-icon-theme blueman lxappearance
      #gtk #gnome.gnomeicontheme

      # Languages and programming tools.
      #nodejs-10_x #yarn
      rustup
      android-studio-3-4-0.android-studio

      # Editors.
      neovim vim vscode

      # Terminal and WM.
      kitty awesome rofi lightlocker
      antibody alacritty
      #polybar 

      # Browsers.
      firefox
      chromium google-chrome

      # Others
      weechat gimp feh slack apvlv postman-7-6-0.postman libreoffice
      gcc wine steam dbeaver skypeforlinux pavucontrol mitmproxy arandr
      nssmdns kubectl minikube-1-2-0.minikube mongodb-compass docker-compose
    ];
  };
}
