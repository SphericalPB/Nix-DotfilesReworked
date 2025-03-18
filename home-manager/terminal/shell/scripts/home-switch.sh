#/bin/bash

nixDir=$HOME/.config/nixConf/
nixUser="sphericalpb"
nixHost="Spherical-Nix"

# > cd to $nixDir 
# > format the nix configuration 
# > notify git if there has been changes in the $nixDir directory
# > rebuild and switch to latest home-manager config
pushd $nixDir
alejandra .
git add .
nh home switch -c $nixUser@$nixHost

# Custom flags. 
# Adding the flag '-s' along with the script skips the git commit and push processes 
while getopts "s" opt;do
  case $opt in
  s)
    echo "Skipping commit and push procedures..."
    ;;
  esac
done

# If there is no flag ommitted, ask for the commit name.
if [[ "$#" -eq 0 ]]; then
    echo 'Please enter a commit name? (keep empty for timestamp)' 
    read -p '> '  commitName 
    if [[ ! -n $commitName ]]; then
      commitName=$(date -u +%F_%H%M%S)
      echo =============================
      printf " > %s\n > %s\n" "No input found" "Setting commit name to timestamp: \"$commitName\""
    fi
    echo =============================
    echo " > Setting up git commit..."
    git commit -am $commitName 
    git push
    echo =============================
    printf " > %s " "Successful commit: \"$commitName\""
fi
# Moves the user back to the previous directory, before the script was ran.
popd

