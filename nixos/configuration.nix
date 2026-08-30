# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, pkgs, ... }:

{
  imports =
    [ # -- Hardware definido en la instalacion --
      ./hardware-configuration.nix
    ];

  # -- BOOTLOADER  --
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda"; # Cambiar a la particion /boot dependiendo la pc
  boot.loader.grub.useOSProber = true;
  # boot.loader.systemd-boot.enable = true; # Cambiar a systemd-boot solo si calamares-
  # boot.loader.efi.canTouchEfiVariables = true; # -> instala systemd-boot

  # -- KERNEL --
  # boot.kernelPackages = linuxPackages_zen; # Cambiar a linux-zen en la pc
  boot.kernelPackages = pkgs.linuxPackages_latest; 

  # -- PROXY --
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # -- INTERNET --
  networking.networkmanager.enable = true; # Ethernet via wpa_supplicant.
  # networking.wireless.enable = true; # WiFi via wpa_supplicant.

  # -- RED Y LOCALE --
  networking.hostName = "nixpc";
  time.timeZone = "America/Mazatlan";
  i18n.defaultLocale = "es_MX.UTF-8";

  # -- TECLADO Y MOUSE/TOUCHPAD --
  services.xserver.xkb = {
     layout = "us";
     variant = "alt-intl";
  };
  console.keyMap = "us";
  # service.libinput.enable = true; # Habilitar touchpad

  # -- IMPRESORAS --
  #  services.printing.enable = true;

  # -- AUDIO --
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true; # APLICACIONES JACK
    #wireplumber.enable = true; # Habilitar Wireplumber
  };

  # -- USUARIO --
  users.users."mario" = {
    isNormalUser = true;
    description = "mario";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # -- GAMING --
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    gamescopeSession.enable = false;
  };

  # -- DRIVERS NVIDIA --
  # hardware.graphics.enable = true;
  # services.xserver.videoDrivers = [ "nvidia" ]
  # hardware.nvidia = {
  #   modesettings.enable = true;
  #   powerManagement.enable = false;
  #   open = false;
  #   nvidiasettings = true;
  #   package = config.boot.kernelPackages.nvidiaPackages.stable;
  # };


  # -- NAVEGADOR --
  programs.firefox.enable = true;

  # -- UNFREE Y EXPERIMENTAL --
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes"];

  # -- DISPLAY MANAGER y DESKTOP/WINDOW MANAGER --
  services.displayManager.ly.enable = true;
  services.displayManager.sessionPackages = [ pkgs.mangowc ]; # WM
  # services.displayManager.gdm.enable = true; # DM
  # services.desktopManager.gnome.enable = true; # DE

  # --PAQUETES DEL SISTEMA--
  # Buscar paquetes y opciones en https://search.nixos.org/
  environment.systemPackages = with pkgs; [ 
    mangowc
    ly
    foot
    yazi
    bluetui
    wiremix
    impala
    btop
    fastfetch
    waybar
    swaybg
    fuzzel
    git
    wget
    curl
    micro
    mpv
    zathura
    chafa
    ffmpeg
    poppler-utils
    imagemagick
    fontforge
    p7zip
    unrar
    jq
    glow
    bat
    file
    jetbrains-mono
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Servicios para habilitar

  # -- SSH --
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # -- FIREWALL --
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?

}
