{...}: {
  imports = [
    ./wayland # Modern WM Compositor
    ./flatpak.nix # Install Flatpak Packages, Declaratively!
    #./lf # Customizable TUI File-Manager
    ./superfile # A Pretty and Modern TUI File-Manager
    ./vscode.nix # A Popular IDE by Microsoft. Required for College
    ./spicetify.nix # Spices up the Spotify app with user-made themes and plugins!
  ];
}
