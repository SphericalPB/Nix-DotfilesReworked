{
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.spicetify-nix.homeManagerModules.default];

  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  in {
    enable = true;
    theme = spicePkgs.themes.comfy;
    colorScheme = "catppuccin-macchiato";
    #theme = {
    #name = "Comfy-Spicetify";
    #src = pkgs.fetFromGithub {
    #  owner = "Comfy-Themes";
    #  repo = "Spicetify";
    #  rev = "2c22f3649a82e599be0e7eb506a0f83459caf9e8";
    #  hash = "sha256-KyhQuWotqcIHb9dU3PZnJe6QWN7LYbczR0W7IAxWGbg=";
    #};

    #injectCss = true;
    #injectThemeJs = true;
    #replaceColors = true;
    #homeConfig = true;
    #overwriteAssets = true;
    #additionalCss = "";
    #};

    enabledCustomApps = with spicePkgs.apps; [
      newReleases
      #reddit
      lyricsPlus
    ];

    enabledExtensions = with spicePkgs.extensions; [
      adblock
      lastfm
      betterGenres
      #history
      #goToSong
      #listPlaylistsWithSong
      #savePlaylists
      playlistIcons
      volumePercentage
    ];
  };
}
