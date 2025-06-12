{pkgs, ...}: {
  environment.systemPackages = [
    # Video Thumbnailer
    pkgs.ffmpegthumbnailer
    # Custom Thumbnailers
    # >> Krita <<
    (
      pkgs.writeTextFile {
        name = "krita-thumbnailer";
        destination = "/share/thumbnailers/kra.thumbnailer";
        text = ''
          [Thumbnailer Entry]
          Exec=sh -c "${pkgs.unzip}/bin/unzip -p %i preview.png > %o"
          MimeType=application/x-krita;
        '';
      }
    )
  ];
}
