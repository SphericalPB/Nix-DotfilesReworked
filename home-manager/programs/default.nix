{...}: {
  imports = [
    ./wayland # Modern WM Compositor
    #./lf # Customizable TUI File-Manager
    ./superfile # A Pretty and Modern TUI File-Manager
    ./flatpak.nix # Install Flatpak Packages, Declaratively!
    ./browser
    ./vscode.nix # A Popular IDE by Microsoft. Required for College
    ./spicetify.nix # Spices up the Spotify app with user-made themes and plugins!
  ];
}
