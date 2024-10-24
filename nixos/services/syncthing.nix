{
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    guiAddress = "127.0.0.1:8384";
    user = "sphericalpb";
    group = "users";
    dataDir = "/home/sphericalpb/.local/share/syncthing";
    configDir = "/home/sphericalpb/.config/syncthing";
    overrideDevices = true;
    overrideFolders = true;
    # I still have zero idea how to make this actually work
    settings = {
      devices = {
        "Spherical-Tab" = {id = "7ADOJWZ-IJHRG2V-3Y6W3PN-BJAQLKI-6G6UATT-7FQO2LC-URU6ZCK-6QEZKAP";};
        "Spherical-Oppo" = {id = "K6POAM7-Z556ZKR-VLTG57G-J7LZNUG-FQ4TFEA-447R6WS-RLVKU7F-KCMEVA3";};
      };
      folders = {
        "Pictures" = {
          id = "5h63m-h4upu";
          path = "/home/sphericalpb/Pictures";
          devices = ["Spherical-Tab" "Spherical-Oppo"];
          versioning = {
            type = "trashcan";
            params.cleanoutDays = "30";
          };
        };

        "Camera (DCIM)" = {
          id = "stsnm-pjz1q";
          path = "/home/sphericalpb/Pictures/Artus/IRL";
          devices = ["Spherical-Tab" "Spherical-Oppo"];
        };

        #"Pinterest" = {
        #  id = "s2j7h-9v0it";
        #  path = "/home/sphericalpb/Pictures/Artus/Not-Mine-but-Cool/Pinterest";
        #  devices = ["Spherical-Tab" "Spherical-Oppo"];
        #};

        "Music" = {
          id = "mzeqq-kle9m";
          path = "/home/sphericalpb/Music";
          devices = ["Spherical-Tab" "Spherical-Oppo"];
        };

        "Obsidian-Vault" = {
          id = "goywh-lr6bw";
          path = "/home/sphericalpb/Documents/Obsidian-Vault";
          devices = ["Spherical-Tab" "Spherical-Oppo"];
          versioning = {
            type = "trashcan";
            params.cleanoutDays = "30";
          };
        };

        "School-Thingies" = {
          id = "aniky-jpbvd";
          path = "/home/sphericalpb/Documents/School-Thingies";
          devices = ["Spherical-Tab" "Spherical-Oppo"];
          versioning = {
            type = "trashcan";
            params.cleanoutDays = "30";
          };
        };
      };
    };
  };
}
