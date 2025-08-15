{...}: {
  programs.zen-browser.profiles.Funky-Rodent = {
    containersForce = true; # Force replace the existing containers configuration
    containers = {
      Personal = {
        color = "blue";
        icon = "briefcase";
        id = 1;
      };
    };
  };
}
