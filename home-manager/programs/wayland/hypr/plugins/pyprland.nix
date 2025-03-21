{pkgs, ...}: {
  home.packages = with pkgs; [
    pyprland
  ];

  wayland.windowManager.hyprland = {
    settings = {
      exec-once = ["pypr"];
      bind = [
        # scratchpads
        "$mod, A, exec, pypr toggle term"
        "CTRL SHIFT, F, exec, pypr toggle fm"
        "$modAlt,T,exec,pypr toggle sys"
        "$modAlt,V,exec,pypr toggle vol"
        # toggle_special
        "$mod, D, togglespecialworkspace, backdoor"
        "$modShift, D, exec, pypr toggle_special backdoor"
      ];
    };
  };

  home.file.".config/hypr/pyprland.toml".text = ''
    [pyprland]
    plugins = ["scratchpads", "toggle_special"]

    [scratchpads.fromTop]
    animation = "fromTop"
    size = "88% 45%"
    margin = 10
    allow_special_workspaces = true
    restore_excluded = true

    [scratchpads.term]
    command = "uwsm app -- kitty --class kitty-term"
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
    match_by = "class"
    class = "org.pulseaudio.pavucontrol"

    [scratchpads.vol]
    animation = "fromright"
    command = "uwsm app -- pavucontrol"
    class = "pavucontrol"
    size = "40% 85%"
    margin = 20
    unfocus = "hide"
    hysteresis = 1
  '';
}
