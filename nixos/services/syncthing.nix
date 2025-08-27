{
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    guiAddress = "127.0.0.1:8384";
    user = "sphericalpb";
    group = "users";
    dataDir = "/home/sphericalpb/.local/share/syncthing/";
    configDir = "/home/sphericalpb/.config/syncthing/";
    overrideDevices = true;
    overrideFolders = true;
    settings = {
      devices = {
        #"Spherical-Tab" = {id = "7ADOJWZ-IJHRG2V-3Y6W3PN-BJAQLKI-6G6UATT-7FQO2LC-URU6ZCK-6QEZKAP";};
        "Spherical-Tablet" = {id = "GINCNFG-YPAOAJF-OK6ZAMR-YEKZM4O-SAOVY6F-TK2ASBP-DIOPHEB-PXJ6ZAZ";};
        #"Spherical-Phone" = {id = "K6POAM7-Z556ZKR-VLTG57G-J7LZNUG-FQ4TFEA-447R6WS-RLVKU7F-KCMEVA3";};
        "Spherical-Phone" = {id = "YKH64SV-4TBW3SN-YEECLD3-7NAIJ4K-HQ6JVMD-CUWOCWL-LZEIPO5-JZTUFAW";};
      };
      folders = {
        "Pictures" = {
          id = "5h63m-h4upu";
          path = "/home/sphericalpb/Pictures/";
          devices = ["Spherical-Tablet" "Spherical-Phone"];
          versioning = {
            type = "trashcan";
            params.cleanoutDays = "30";
          };
        };

        "DCIM" = {
          id = "n9xgp-9xssv";
          path = "/home/sphericalpb/DCIM/";
          devices = ["Spherical-Tablet" "Spherical-Phone"];
          versioning = {
            type = "trashcan";
            params.cleanoutDays = "30";
          };
        };

        "Music" = {
          id = "mzeqq-kle9m";
          path = "/home/sphericalpb/Music/";
          devices = ["Spherical-Tablet" "Spherical-Phone"];
        };

        "Obsidian-Notes" = {
          id = "goywh-lr6bw";
          path = "/home/sphericalpb/Documents/Obsidian-Notes/";
          devices = ["Spherical-Tablet" "Spherical-Phone"];
          versioning = {
            type = "trashcan";
            params.cleanoutDays = "30";
          };
        };

        "Homework-n-Activities" = {
          id = "aniky-jpbvd";
          path = "/home/sphericalpb/Documents/Homework/";
          devices = ["Spherical-Tablet" "Spherical-Phone"];
          versioning = {
            type = "trashcan";
            params.cleanoutDays = "30";
          };
        };
      };
    };
  };
}
