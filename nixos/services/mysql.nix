{pkgs, ...}: {
  services = {
    # For org.freedesktop.secrets to work required by MySQL
    gnome.gnome-keyring.enable = true;
    # MySQL Server
    mysql = {
      enable = true;
      package = pkgs.mariadb;
    };
  };

  security.pam.services.lightdm.enableGnomeKeyring = true;
  programs.ssh.startAgent = true;

  environment.systemPackages = with pkgs; [
    mysql-workbench
  ];
}
