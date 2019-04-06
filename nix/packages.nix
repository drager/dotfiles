{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfreePredicate = pkg:
    pkgs.lib.elem (builtins.parseDrvName pkg.name).name
    [ "firefox-bin" "vscode" ];

  environment.systemPackages = with pkgs; [
    # Tools and utilities.
    wget curl git xclip theme-vertex

    # Themeing, greeter.
    numix-gtk-theme numix-icon-theme

    # Languages and programming tools.
    # nodejs-10_x yarn
    # android-studio

    # Editors.
    neovim vim #vscode

    # Terminal and WM.
    kitty awesome lightlocker rofi
    polybar

    # Browsers.
    firefox #firefox-developer-edition

    #gimp
  ];

}
