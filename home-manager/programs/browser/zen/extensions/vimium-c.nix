{
  inputs,
  pkgs,
  ...
}: {
  programs.zen-browser.profiles.Funky-Rodent.extensions = {
    packages = with inputs.firefox-addons.packages."${pkgs.system}"; [
      vimium-c
    ];
    settings = {
      "vimium-c@gdh1995.cn".settings = {
        force = true;
        # Default Search Engine
        #searchUrl = "https://search.brave.com/search?q=$s Brave";
        preferBrowserSearch = true;

        #Custom search engines
        searchEngines = ''
          br|brave: https://search.brave.com/search?q=%s Brave \
            blank=https://search.brave.com/search?q=%s
          y|yt: https://www.youtube.com/results?search_query=%s \
            blank=https://www.youtube.com/ YouTube
          p: https://search.nixos.org/packages?channel=unstable&query=%s nixPackages
          c|o: https://search.nixos.org/options?channel=unstable&query=%s nixSearch
          h: https://home-manager-options.extranix.com/?query=%s&release=master Home-Manager
          \:i: vimium://sed/s/^//,lower\ $S re= Lower case
          v.m|math: vimium://math\ $S re= Calculate
          v.p: vimium://parse\ $S re= Redo Search
        '';

        #Custom key mappings
        keyMappings = ''
          #!no-check\n
          map J nextTab\n
          map K previousTab
        '';
      };
    };
  };
}
