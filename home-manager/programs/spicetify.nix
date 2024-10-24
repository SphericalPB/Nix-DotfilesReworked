{
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [inputs.spicetify-nix.homeManagerModules.default];

  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  in {
    enable = true;
    theme = spicePkgs.themes.text;
    colorScheme = "catppuccinMacchiato";

    enabledCustomApps = with spicePkgs.apps; [
      newReleases
      #reddit
      lyricsPlus
    ];

    enabledExtensions = with spicePkgs.extensions; [
      adblock
      lastfm
      betterGenres
      history
      goToSong
      listPlaylistsWithSong
      savePlaylists
      playlistIcons
      volumePercentage
    ];
  };
}
