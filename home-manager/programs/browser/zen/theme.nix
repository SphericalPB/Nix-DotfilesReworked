{config, ...}: {
  # Reference: https://github.com/permafrozen/nivis/tree/56a3997d88e6e542f1a17924de906d1ca3757cff/module/zen-browser
  programs.zen-browser.profiles.Funky-Rodent = {
    userChrome = ''
      :root {
        --zen-colors-primary: #${config.lib.stylix.colors.base01} !important;
        --zen-primary-color: #${config.lib.stylix.colors.base08} !important;
        --zen-colors-secondary: #${config.lib.stylix.colors.base01} !important;
        --zen-colors-tertiary: #${config.lib.stylix.colors.base02} !important;
        --zen-colors-border: #${config.lib.stylix.colors.base08} !important;
        --toolbarbutton-icon-fill: #${config.lib.stylix.colors.base08} !important;
        --lwt-text-color: #${config.lib.stylix.colors.base05} !important;
        --toolbar-field-color: #${config.lib.stylix.colors.base05} !important;
        --tab-selected-textcolor: #${config.lib.stylix.colors.base05} !important;
        --toolbar-field-focus-color: #${config.lib.stylix.colors.base05} !important;
        --toolbar-color: #${config.lib.stylix.colors.base05} !important;
        --newtab-text-primary-color: #${config.lib.stylix.colors.base05} !important;
        --arrowpanel-color: #${config.lib.stylix.colors.base05} !important;
        --arrowpanel-background: #${config.lib.stylix.colors.base00} !important;
        --sidebar-text-color: #${config.lib.stylix.colors.base05} !important;
        --lwt-sidebar-text-color: #${config.lib.stylix.colors.base05} !important;
        --lwt-sidebar-background-color: #${config.lib.stylix.colors.base03} !important;
        --toolbar-bgcolor: #${config.lib.stylix.colors.base01} !important;
        --newtab-background-color: #${config.lib.stylix.colors.base00} !important;
        --zen-themed-toolbar-bg: #${config.lib.stylix.colors.base02} !important;
        --zen-main-browser-background: #${config.lib.stylix.colors.base02} !important;
        --toolbox-bgcolor-inactive: #${config.lib.stylix.colors.base02} !important;
      }

      #permissions-granted-icon {
        color: #${config.lib.stylix.colors.base02} !important;
      }

      .sidebar-placesTree {
        background-color: #${config.lib.stylix.colors.base00} !important;
      }

      #zen-workspaces-button {
        background-color: #${config.lib.stylix.colors.base00} !important;
      }

      #TabsToolbar {
        background-color: #${config.lib.stylix.colors.base02} !important;
      }

      #urlbar-background {
        background-color: #${config.lib.stylix.colors.base00} !important;
      }

      .content-shortcuts {
        background-color: #${config.lib.stylix.colors.base00} !important;
        border-color: #${config.lib.stylix.colors.base08} !important;
      }

      .urlbarView-url {
        color: #${config.lib.stylix.colors.base08} !important;
      }

      #zenEditBookmarkPanelFaviconContainer {
        background: #${config.lib.stylix.colors.base03} !important;
      }

      #zen-media-controls-toolbar {
        & #zen-media-progress-bar {
          &::-moz-range-track {
            background: #${config.lib.stylix.colors.base01} !important;
          }
        }
      }

      toolbar .toolbarbutton-1 {
        &:not([disabled]) {
          &:is([open], [checked])
            > :is(
              .toolbarbutton-icon,
              .toolbarbutton-text,
              .toolbarbutton-badge-stack
            ) {
            fill: #${config.lib.stylix.colors.base03};
          }
        }
      }

      .identity-color-blue {
        --identity-tab-color: #${config.lib.stylix.colors.base0D} !important;
        --identity-icon-color: #${config.lib.stylix.colors.base0D} !important;
      }

      .identity-color-turquoise {
        --identity-tab-color: #${config.lib.stylix.colors.base0C} !important;
        --identity-icon-color: #${config.lib.stylix.colors.base0C} !important;
      }

      .identity-color-green {
        --identity-tab-color: #${config.lib.stylix.colors.base0B} !important;
        --identity-icon-color: #${config.lib.stylix.colors.base0B} !important;
      }

      .identity-color-yellow {
        --identity-tab-color: #${config.lib.stylix.colors.base0A} !important;
        --identity-icon-color: #${config.lib.stylix.colors.base0A} !important;
      }

      .identity-color-orange {
        --identity-tab-color: #${config.lib.stylix.colors.base09} !important;
        --identity-icon-color: #${config.lib.stylix.colors.base09} !important;
      }

      .identity-color-red {
        --identity-tab-color: #${config.lib.stylix.colors.base08} !important;
        --identity-icon-color: #${config.lib.stylix.colors.base08} !important;
      }

      .identity-color-pink {
        --identity-tab-color: #${config.lib.stylix.colors.base0E} !important;
        --identity-icon-color: #${config.lib.stylix.colors.base0E} !important;
      }

      .identity-color-purple {
        --identity-tab-color: #${config.lib.stylix.colors.base0F} !important;
        --identity-icon-color: #${config.lib.stylix.colors.base0F} !important;
      }

      hbox#titlebar {
        background-color: #${config.lib.stylix.colors.base02} !important;
      }

      #zen-appcontent-navbar-container {
        background-color: #${config.lib.stylix.colors.base02} !important;
      }
    '';

    userContent = ''
      /* Common variables affecting all pages */
      @-moz-document url-prefix("about:") {
        :root {
          --in-content-page-color: #${config.lib.stylix.colors.base05} !important;
          --color-accent-primary: #${config.lib.stylix.colors.base08} !important;
          --color-accent-primary-hover: #${config.lib.stylix.colors.base08} !important;
          --color-accent-primary-active: #${config.lib.stylix.colors.base08} !important;
          background-color: #${config.lib.stylix.colors.base00} !important;
          --in-content-page-background: #${config.lib.stylix.colors.base00} !important;
        }
      }

      /* Variables and styles specific to about:newtab and about:home */
      @-moz-document url("about:newtab"), url("about:home") {

        :root {
          --newtab-background-color: #${config.lib.stylix.colors.base00} !important;
          --newtab-background-color-secondary: #${config.lib.stylix.colors.base01} !important;
          --newtab-element-hover-color: #${config.lib.stylix.colors.base01} !important;
          --newtab-text-primary-color: #${config.lib.stylix.colors.base05} !important;
          --newtab-wordmark-color: #${config.lib.stylix.colors.base05} !important;
          --newtab-primary-action-background: #${config.lib.stylix.colors.base08} !important;
        }

        .icon {
          color: #${config.lib.stylix.colors.base08} !important;
        }

        .search-wrapper .logo-and-wordmark .logo {
          background: url("zen-logo-{{ flavor.identifier }}.svg"), url("https://raw.githubusercontent.com/IAmJafeth/zen-browser/main/themes/{{ flavor.identifier | capitalize}}/{{ accent | capitalize }}/zen-logo-{{ flavor.identifier }}.svg") no-repeat center !important;
          display: inline-block !important;
          height: 82px !important;
          width: 82px !important;
          background-size: 82px !important;
        }

        @media (max-width: 609px) {
          .search-wrapper .logo-and-wordmark .logo {
            background-size: 64px !important;
            height: 64px !important;
            width: 64px !important;
          }
        }

        .card-outer:is(:hover, :focus, .active):not(.placeholder) .card-title {
          color: #${config.lib.stylix.colors.base08} !important;
        }

        .top-site-outer .search-topsite {
          background-color: #${config.lib.stylix.colors.base0D} !important;
        }

        .compact-cards .card-outer .card-context .card-context-icon.icon-download {
          fill: #${config.lib.stylix.colors.base0B} !important;
        }
      }

      /* Variables and styles specific to about:preferences */
      @-moz-document url-prefix("about:preferences") {
        :root {
          --zen-colors-tertiary: #${config.lib.stylix.colors.base02} !important;
          --in-content-text-color: #${config.lib.stylix.colors.base05} !important;
          --link-color: #${config.lib.stylix.colors.base08} !important;
          --link-color-hover: #${config.lib.stylix.colors.base08} !important;
          --zen-colors-primary: #${config.lib.stylix.colors.base01} !important;
          --in-content-box-background: #${config.lib.stylix.colors.base01} !important;
          --zen-primary-color: #${config.lib.stylix.colors.base08} !important;
        }

        groupbox , moz-card {
          background: #${config.lib.stylix.colors.base00} !important;
        }

        button,
        groupbox menulist {
          background: #${config.lib.stylix.colors.base01} !important;
          color: #${config.lib.stylix.colors.base05} !important;
        }

        .main-content {
          background-color: #${config.lib.stylix.colors.base03} !important;
        }

        .identity-color-blue {
          --identity-tab-color: #${config.lib.stylix.colors.base0D} !important;
          --identity-icon-color: #${config.lib.stylix.colors.base0D} !important;
        }

        .identity-color-turquoise {
          --identity-tab-color: #${config.lib.stylix.colors.base0C} !important;
          --identity-icon-color: #${config.lib.stylix.colors.base0C} !important;
        }

        .identity-color-green {
          --identity-tab-color: #${config.lib.stylix.colors.base0B} !important;
          --identity-icon-color: #${config.lib.stylix.colors.base0B} !important;
        }

        .identity-color-yellow {
          --identity-tab-color: #${config.lib.stylix.colors.base0A} !important;
          --identity-icon-color: #${config.lib.stylix.colors.base0A} !important;
        }

        .identity-color-orange {
          --identity-tab-color: #${config.lib.stylix.colors.base09} !important;
          --identity-icon-color: #${config.lib.stylix.colors.base09} !important;
        }

        .identity-color-red {
          --identity-tab-color: #${config.lib.stylix.colors.base08} !important;
          --identity-icon-color: #${config.lib.stylix.colors.base08} !important;
        }

        .identity-color-pink {
          --identity-tab-color: #${config.lib.stylix.colors.base0E} !important;
          --identity-icon-color: #${config.lib.stylix.colors.base0E} !important;
        }

        .identity-color-purple {
          --identity-tab-color: #${config.lib.stylix.colors.base0F} !important;
          --identity-icon-color: #${config.lib.stylix.colors.base0F} !important;
        }
      }

      /* Variables and styles specific to about:addons */
      @-moz-document url-prefix("about:addons") {
        :root {
          --zen-dark-color-mix-base: #${config.lib.stylix.colors.base02} !important;
          --background-color-box: #${config.lib.stylix.colors.base00} !important;
        }
      }

      /* Variables and styles specific to about:protections */
      @-moz-document url-prefix("about:protections") {
        :root {
          --zen-primary-color: #${config.lib.stylix.colors.base00} !important;
          --social-color: #${config.lib.stylix.colors.base0F} !important;
          --coockie-color: #${config.lib.stylix.colors.base0C} !important;
          --fingerprinter-color: #${config.lib.stylix.colors.base0A} !important;
          --cryptominer-color: #${config.lib.stylix.colors.base0E} !important;
          --tracker-color: #${config.lib.stylix.colors.base0B} !important;
          --in-content-primary-button-background-hover: #${config.lib.stylix.colors.base01} !important;
          --in-content-primary-button-text-color-hover: #${config.lib.stylix.colors.base05} !important;
          --in-content-primary-button-background: #${config.lib.stylix.colors.base01} !important;
          --in-content-primary-button-text-color: #${config.lib.stylix.colors.base05} !important;
        }

        .card {
          background-color: #${config.lib.stylix.colors.base01} !important;
        }
      }
    '';
  };
}
