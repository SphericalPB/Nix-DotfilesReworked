## My current NixOS Configuration

#### How to install:
- Just clone this repo to the desired location.
````
git clone git@github.com:SphericalPB/Nix-DotfilesReworked.git [path]
````

- *From the Installation Media* \
``Hint: #[HostName]``
In this case, "Spherical-Nix" is the Host Name stated in the config.
````
nixos-install --flake /path/to/config#Spherical-Nix
````

- *From existing NixOS installation*
````
nixos-rebuild switch --flake /path/to/config#Spherical-Nix
````

- *Install home-manager config* \
``Hint: #[Username]@[HostName]``
In this case, "sphericalpb" is the username stated in the `home.nix`. \
And "Spherical-NixOS" is the Host you want to install the config to.
````
home-manager switch --flake /path/to/config#sphericalpb@Spherical-NixOS
````
- *Updating Flakes*
````
nix flake update --commit-lock-file 
````
Then rebuild switch either the nixos config or home-manager config (or both)\
to update the installed programs

---

#### TODO:
- [x] Create a script that automatically commit and push the config to github
- [ ] Replace pyprland's scratchpads with a standalone hyprland plugin
- [ ] Make colorschemes separate between global and user-specific themes with stylix
- [ ] Configure or replace "Tide" prompt for for fish shell
- [ ] Turn the `configuration.nix` config into separate modules similar to home-manager
- [ ] Find, copy, or create a taskbar for Hyprland
- [ ] Make it so polkit-gnome is the default polkit prompt but have Hyprland specifically use hyprpolkit instead
- [x] Install KDE Plasma
- [ ] Make X11 DE's work with greetd
