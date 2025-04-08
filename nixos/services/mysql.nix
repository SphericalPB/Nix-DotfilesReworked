{pkgs, ...}: {
  networking.firewall.allowedTCPPorts = [3306];
  services = {
    # For org.freedesktop.secrets to work required by MySQL
    gnome.gnome-keyring.enable = true;
    # MySQL Server
    mysql = {
      enable = true;
      package = pkgs.mariadb;
      user = "";
    };
  };

  security.pam.services.greetd.enableGnomeKeyring = true;
  programs.ssh.startAgent = true;

  environment.systemPackages = [
    pkgs.mysql-workbench
  ];
}
