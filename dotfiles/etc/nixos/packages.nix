{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfreePredicate = pkg:
    pkgs.lib.elem (builtins.parseDrvName pkg.name).name
    [ "firefox-bin" "vscode" "google-chrome" ];

  programs.adb.enable = true;
  programs.slock.enable = true;

  environment = with pkgs; {
    systemPackages = [
      # Tools and utilities.
      mkpasswd wget curl git xclip theme-vertex file
      unzip zip ranger keychain

      # Themeing, greeter.
      numix-gtk-theme numix-icon-theme blueman lxappearance
      #gtk #gnome.gnomeicontheme

      # Languages and programming tools.
      #nodejs-10_x #yarn
      rustup
      android-studio

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
      weechat gimp feh slack
    ];
  };
}
