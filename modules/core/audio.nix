{ pkgs, ... }:
{
  services.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
        # lowLatency.enable = true;
    jack.enable = true;
  };
    environment.systemPackages = with pkgs; [ pulseaudioFull ];
}
