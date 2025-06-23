{pkgs, ...}: {
  environment.systemPackages = [
    # Video Thumbnailer
    pkgs.ffmpegthumbnailer
    # Custom Thumbnailers
    # [ (.kra) Krita Thumbnailer ]
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
    #[ (.pdf) PDF Thumbnails ]
    (
      pkgs.writeTextFile {
        name = "pdf-thumbnailer";
        destination = "/share/thumbnailers/pdf.thumbnailer";
        text = ''
          [Thumbnailer Entry]
          Exec=sh -c "${pkgs.ghostscript}/bin/gs -dBATCH -dNOPAUSE -sDEVICE=pngalpha -dMaxBitmap=500000000 -dAlignToPixels=0 -dGridFitTT=0 -r150x150 -sOutputFile=%o %i"
          MimeType=application/pdf
        '';
      }
    )
  ];
}
