{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.zen-browser.homeModules.twilight
    ./theme.nix
    ./search.nix
    ./containers.nix
    ./extensions
  ];

  programs.zen-browser = {
    enable = true;
    profiles = {
      Funky-Rodent = {
        isDefault = true;
        id = 0;
        settings = {
          zen.welcome-screen.seen = true;
          zen.view.experimental-no-window-controls = true;
        };
      };
      #Disco-Cat = {
      #  id = 1;
      #  path = "Disco-Cat";
      #};
    };
    nativeMessagingHosts = [pkgs.firefoxpwa];
    policies = {
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };
  };
}
