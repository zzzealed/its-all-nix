{ pkgs, flakeInputs, ... }:
{
  config = {
    # Networking
    networking.networkmanager.enable = true;
    #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    # Locale
    time.timeZone = "Europe/Copenhagen";
    i18n.defaultLocale = "en_DK.UTF-8";
    i18n.extraLocaleSettings = {
      LC_ADDRESS = "da_DK.UTF-8";
      LC_IDENTIFICATION = "da_DK.UTF-8";
      LC_MEASUREMENT = "da_DK.UTF-8";
      LC_MONETARY = "da_DK.UTF-8";
      LC_NAME = "da_DK.UTF-8";
      LC_NUMERIC = "da_DK.UTF-8";
      LC_PAPER = "da_DK.UTF-8";
      LC_TELEPHONE = "da_DK.UTF-8";
      LC_TIME = "da_DK.UTF-8";
    };
    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };
    # Configure console keymap
    console.keyMap = "us";
    # Sound
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      #jack.enable = true;
    };
    # Packages
    environment.systemPackages = with pkgs; [ gparted ]; # The very essential package
  };
}
