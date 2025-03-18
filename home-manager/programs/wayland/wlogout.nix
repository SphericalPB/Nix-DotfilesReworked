{...}: {
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "logout";
        action = "loginctl terminate-user ''";
        text = "Logout";
        keybind = "l";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
    ];
  };
}
