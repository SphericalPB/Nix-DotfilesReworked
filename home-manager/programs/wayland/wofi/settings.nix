{...}: {
  programs.wofi.settings = {
    show = "drun";
    prompt = "What'cha wanna do today?";
    insensitive = true;
    allow_images = true;
  };
}
