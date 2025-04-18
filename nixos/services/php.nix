{...}: {
  networking.firewall.allowedTCPPorts = [80 443];

  services.httpd.enable = true;
  services.httpd.adminAddr = "webmaster@example.org";
  services.httpd.enablePHP = true; # oof... not a great idea in my opinion

  services.httpd.virtualHosts."example.org" = {
    documentRoot = "/var/www/example.org";
    #documentroot = "/home/sphericalpb/Documents/School-Thingies/Assignments/2nd-Semester/Playground/www/docs";
    # want ssl + a let's encrypt certificate? add `forceSSL = true;` right here
  };

  # hacky way to create our directory structure and index page... don't actually use this
  systemd.tmpfiles.rules = [
    "d /var/www/example.org"
    "f /var/www/example.org/index.php - - - - <?php phpinfo();"
    #"f /home/sphericalpb/Documents/School-Thingies/Assignments/2nd-Semester/Playground/www/docs/index.php - - - - <?php phpinfo();"
  ];
}
