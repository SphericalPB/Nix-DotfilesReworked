{pkgs, ...}: {
  home.packages = with pkgs; [
    unstable.pyprland
  ];

  wayland.windowManager.hyprland = {
    settings = {
      exec-once = ["uwsm app -- pypr"];
      bind = [
        # scratchpads
        "$mod, A, exec, pypr toggle term"
        "CTRL SHIFT, F, exec, pypr toggle fm"
        "$modAlt,T,exec,pypr toggle sys"
        "$modAlt,V,exec,pypr toggle vol"
      ];
    };
  };

  home.file.".config/hypr/pyprland.toml".text = ''
    [pyprland]
    # hyprland deprecated the old windowrule method (v1) in place of windowrulev2, which broke some regex detection used by scratchpad
    # Temporary fix. https://github.com/hyprland-community/pyprland/issues/164
    hyprland_version = '0.47.3'
    plugins = ["scratchpads"]

    [scratchpads.fromTop]
    animation = "fromTop"
    size = "88% 45%"
    margin = 10
    allow_special_workspaces = true

    [scratchpads.term]
    command = "uwsm app -- kitty --class kitty-dropterm"
    class = "kitty-dropterm"
    use = "fromTop"
    excludes = ["fm"]

    [scratchpads.fm]
    command = "uwsm app -- kitty --class kitty-fm superfile"
    class = "kitty-fm"
    use = "fromTop"
    excludes = ["term"]

    [scratchpads.sys]
    command = "uwsm app -- kitty --class kitty-sys btop"
    animation = "fromBottom"
    class = "kitty-sys"
    size = "88% 45%"
    margin = 20

    [scratchpads.vol]
    animation = "fromright"
    command = "uwsm app -- pavucontrol"
    matchby = "class"
    class = "org.pulseaudio.pavucontrol"
    size = "40% 85%"
    margin = 20
    unfocus = "hide"
    hysteresis = 0.8
  '';
}
