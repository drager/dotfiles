{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./users.nix
      ./xserver.nix
      ./packages.nix
      ./direnv.nix
      ./custom-versions.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enableCryptodisk = true;

  virtualisation.virtualbox.host.enable = true;

  services.printing.enable = true;
  services.avahi.enable = true;
  services.avahi.publish.enable = true;
  services.avahi.publish.userServices = true;
  services.avahi.nssmdns = true;

  virtualisation.docker.enable = true;

  services.printing.browsing = true;
  services.printing.listenAddresses = [ "*:631" ];
  services.printing.defaultShared = true;

  networking.firewall.allowedUDPPorts = [ 631 ];
  networking.firewall.allowedTCPPorts = [ 631 ];

  nixpkgs.config = {
    allowUnfree = true;

    #chromium.enableWideVine = true;
  };

  #hardware.nvidia.prime.sync.enable = true;

 #hardware.nvidia.prime = {
  #  sync.enable = true;

    # Bus ID of the Intel GPU. You can find it using lspci, either under 3D or VGA
   # intelBusId = "PCI:0:2:0";

    # Bus ID of the NVIDIA GPU. You can find it using lspci, either under 3D or VGA
    #nvidiaBusId = "PCI:1:0:0";
  #};

  #hardware.nvidiaOptimus.disable = true;
  #hardware.opengl.extraPackages = [ pkgs.linuxPackages.nvidia_x11.out ];
  #hardware.opengl.extraPackages32 = [ pkgs.linuxPackages.nvidia_x11.lib32 ];

  hardware.opengl.driSupport32Bit = true;

  # Enable sound.
  sound.enable = true;

  hardware.pulseaudio = {
    enable = true;

    support32Bit = true;

    # NixOS allows either a lightweight build (default) or full build of PulseAudio to be installed.
    # Only the full build has Bluetooth support, so it must be selected here.
    package = pkgs.pulseaudioFull;
  };

  hardware.bluetooth.enable = true;

  networking.hostName = "icarus"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  #networking.networkmanager.enable = true;

  #networking.supplicant.wlp2s0.extraConf = ''
  #  ctrl_interface=/run/wpa_supplicant
  #  ctrl_interface_group=wheel
  #'';

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "20.09";
}
