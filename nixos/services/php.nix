{...}: {
  networking.firewall.allowedTCPPorts = [80 443];

  services.httpd = {
    enable = true;
    adminAddr = "webmaster@example.org";
    enablePHP = true;
    virtualHosts = {
      "example.org" = {
        documentRoot = "/home/sphericalpb/Documents/School-Thingies/Assignments/2nd-Semester/Playground/www/example.org";
      };
      "teakha.org" = {
        documentRoot = "/home/sphericalpb/Documents/School-Thingies/Assignments/2nd-Semester/Projects/www/teakha.org";
      };
    };
  };

  # hacky way to create our directory structure and index page... don't actually use this
  systemd.tmpfiles.rules = [
    "d /var/www/example.org"
  ];
}
