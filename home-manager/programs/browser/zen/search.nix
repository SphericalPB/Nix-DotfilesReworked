{...}: {
  programs.zen-browser.profiles.Funky-Rodent.search = {
    #default = "br"; # Brave Search by default
    engines = {
      # Brave Search
      brave-search = {
        name = "Brave Search";
        urls = [
          {
            template = "https://search.brave.com/search";
            params = [
              {
                name = "q";
                value = "{searchTerms}";
              }
            ];
          }
        ];
        definedAliases = ["br"];
      };
      # Nix Search
      nix-packages = {
        name = "Nix Packages";
        urls = [
          {
            template = "https://search.nixos.org/packages";
            params = [
              {
                name = "type";
                value = "packages";
              }
              {
                name = "channel";
                value = "unstable";
              }
              {
                name = "query";
                value = "{searchTerms}";
              }
            ];
          }
        ];
        definedAliases = ["p"];
      };
      nix-options = {
        name = "Nix Options";
        urls = [
          {
            template = "https://search.nixos.org/options";
            params = [
              {
                name = "type";
                value = "options";
              }
              {
                name = "channel";
                value = "unstable";
              }
              {
                name = "query";
                value = "{searchTerms}";
              }
            ];
          }
        ];
        definedAliases = ["o"];
      };
      nix-home = {
        name = "Nix Home-Manager";
        urls = [
          {
            template = "https://home-manager-options.extranix.com";
            params = [
              {
                name = "release";
                value = "master";
              }
              {
                name = "query";
                value = "{searchTerms}";
              }
            ];
          }
        ];
        definedAliases = ["h"];
      };
    };
  };
}
