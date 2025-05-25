# Video-related packages
{ pkgs, config, ...}:
{
  config = {
    environment.systemPackages = with pkgs; [
      ffmpeg
      yt-dlp
      unstable.libplacebo
      mediainfo
      unstable.mesa
    ];
  };
}
