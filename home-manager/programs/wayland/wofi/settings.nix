{...}: {
  programs.wofi.settings = {
    show = "drun";
    prompt = "What'cha wanna do today?";
    insensitive = true;
    allow_images = true;
    key_left = "H";
    key_down = "J";
    key_up = "K";
    key_right = "L";
  };
}
