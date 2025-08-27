{
  inputs,
  lib,
  pkgs,
  ...
}: {
  # Nix keeps complaining about unfree packages despite already having allowUnfree set to true;
  # Dirty solution: Merging the mit license with the unfree package/extension (thanks iynaix from Vimjoyer Discord!)
  programs.zen-browser.profiles.Funky-Rodent.extensions = {
    packages = with inputs.firefox-addons.packages."${pkgs.system}"; [
      (improved-tube.overrideAttrs (o: {
        meta = o.meta // {license = lib.licenses.mit;};
      }))
    ];
    settings."{3c6bf0cc-3ae2-42fb-9993-0d33104fdcaf}" = {
      force = true;
      settings = {
        # Appearance
        comments_sidebar = true;
        sidebar_left = true;
        always_show_progress_bar = true;
        hide_download_button = "hidden";
        hide_more_button = true;

        # General
        font = "Comfortaa";
        change_thumbnails_per_row = 6;
        disable_thumbnail_playback = true;
        hide_thumbnail_overlay = true;
        hide_ai_summary = true;
        redirect_shorts_to_watch = true;
        remove_home_page_shorts = true;
        remove_shorts_reel_search_results = true;
        remove_member_only = true;

        # Player
        ambient_lighting = false;
      };
    };
  };
}
