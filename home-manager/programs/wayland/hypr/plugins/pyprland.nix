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
    plugins = ["scratchpads", "toggle_special", "magnify"]

    [scratchpads.term]
    animation = "fromTop"
    command = "uwsm app -- kitty --class kitty-term"
    class = "kitty-dropterm"
    size = "88% 55%"
    margin = 10
    excludes = ["fm"]

    [scratchpads.fm]
    animation = "fromTop"
    command = "uwsm app -- kitty --class kitty-fm superfile"
    class = "kitty-fm"
    size = "88% 55%"
    margin = 10
    excludes = ["term"]

    [scratchpads.sys]
    animation = "fromBottom"
    command = "uwsm app -- kitty --class kitty-sys btop"
    class = "kitty-sys"
    size = "88% 45%"
    margin = 20

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
