{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium; # Free and Telemetry free version of Visual Studio
  };
}
