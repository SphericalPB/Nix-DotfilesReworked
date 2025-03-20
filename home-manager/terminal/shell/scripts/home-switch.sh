#/bin/bash
## Author's note: This is so shit (￣ヘ￣)

nixDir=$HOME/.config/nixConf
nixUser="sphericalpb"
nixHost="Spherical-Nix"
# > cd to $nixDir 
# > format the nix configuration 
# > notify git if there has been changes in the $nixDir directory
# > rebuild and switch to latest home-manager config
function rebuild() { 
  pushd $nixDir
  alejandra .
  git add .
  nh home switch -c $nixUser@$nixHost
}

# Custom flags. 
# Adding the flag '-s' along with the script skips the git commit and push processes 
while getopts "hsu" opt;do
  case $opt in
  h)
    echo "rebuild-switch [-h|-s|-u]"
    printf "%s\n" "-h | show list of a available flags" "-s | skip git commit and push" "-u | update flakes packages"
    exit
    ;;
  s)
    ;;
  u) 
    pushd $nixDir; nix flake update; popd
    ;;
  esac
done

rebuild

# If there the flag omitted isnt '-s', ask for the commit name.
if [[ ! \ $*\  == *\ -s\ * ]]; then
    echo =============================
    echo 'Please enter a commit name? (keep empty for timestamp)' 
    read -p '> '  commitName
    if [[ ! -n $commitName ]]; then
      commitName=$(date -u +%F_%H%M%S)
      echo =============================
      printf " > %s\n > %s\n" "No input found" "Setting commit name to timestamp: \"$commitName\""
    fi
    echo =============================
    echo " > Setting up git commit..."
    git commit -am "$commitName" 
    git push
    echo =============================
    printf " > %s " "Successful commit: \"$commitName\""
  else
    echo =============================
    echo "Skipping commit and push procedures..."
fi
# Moves the user back to the previous directory, before the script was ran.
popd


