{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.zen-browser.homeModules.beta
    ./theme.nix
    ./search.nix
    ./containers.nix
    ./extensions
  ];

  programs.zen-browser = {
    enable = true;
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
      #EnableTrackingProtection = {
      #  Value = true;
      #  Locked = true;
      #  Cryptomining = true;
      #  Fingerprinting = true;
      #};
    };
    profiles.Funky-Rodent.settings = {
      zen.welcome-screen.seen = true;
    };
  };
}
