{ glance-ical-events, ... }: {
  imports = [
    ./traefik.nix
    ./nameserver.nix
    ./nginx.nix
    ./grafana.nix
    ./gitea.nix
    ../helper/jail.nix
    ./glanceapp.nix
    ./traefikmiddlewares/default.nix
    ./databases/mysql.nix
    ./recursivedns.nix
    ./bootserver.nix
    ./gotify.nix
    ./uptime-kuma.nix
    ./vaultwarden.nix
    glance-ical-events.nixosModules.default
  ];

  systemd.tmpfiles.rules = [ "d /run/jails/ 0755 root root -" ];
}
