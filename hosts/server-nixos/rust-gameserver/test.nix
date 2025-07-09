{ ... }:
{
  options = {
    services.rust-gameserver = {
      settings = {
        server.port = lib.mkOption {
          description = "Sets the port people will use to connect to the game";
          type = with lib.types; nullOr port;
          default = null;
        };
      };
  };

  config = {
    systemd.services.rust-gameserver = {
      serviceConfig = {
        ExecStart = lib.escapeShellArgs [
        ]
        ++ lib.optionals (cfg.settings.server.port != null) [ "+server.port" cfg.settings.server.port ]
        ++ lib.optionals (cfg.settings.server.url != null) ["+server.url" cfg.settings.url]
        /* osv... */;
    };
  };
}
