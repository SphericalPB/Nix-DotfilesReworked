#/bin/bash
## Author's note: This is so shit (￣ヘ￣)

nixDir=$HOME/.config/nixConf
nixUser="sphericalpb"
nixHost="Spherical-Nix"

# Silence pushd and popd
function pushd() { builtin pushd "$@" > /dev/null; }
function popd() { builtin popd "$@" > /dev/null; }

# > cd to $nixDir 
# > format the nix configuration 
# > notify git if there has been changes in the $nixDir directory
# > rebuild and switch to latest home-manager config
function rebuild() { 
  pushd "$nixDir"
  alejandra .
  git add .
  nh os switch -H "$nixHost" "$@"
}

homeRebuild=""
skipCommit=""
updateFlag=""

# Custom flags. 
while getopts "hasu" opt;do
  case $opt in
  h)
    printf "%s\n\n" "rebuild-switch [-h|-a|-s|-u]"
    printf "%s\n" \
      "-h | show list of a available flags" \
      "-a | rebuild home-manager config" "-s | skip git commit and push" \ 
      "-u | update flakes packages"
    exit
    ;;
  a)
    homeRebuild="1"
    ;;
  s) 
    skipCommit="1"
    ;;
  u) 
    updateFlag="-u"
    ;;
  ?)
    printf "%s\n\n" "Invalid option: -$opt" "rebuild-switch [-h|-a|-s|-u]"
    printf "%s\n" \ 
      "-h | show list of a available flags" \
      "-a | rebuild home-manager config" \
      "-s | skip git commit and push"
    exit 1
    ;;
  esac
done

# If homeRebuild is a non-empty string, then overwrite the rebuild function 
# that rebuilds the home-manager configuration instead of system.
if [[ -n "$homeRebuild" ]]; then
  function rebuild() { 
    pushd "$nixDir"
    alejandra .
    git add .
    nh home switch -c "$nixUser@$nixHost" "$@"
  }
fi

# If the user appends "-u", update while rebuilding home/system 
rebuild $updateFlag

# If skipCommit is an empty string, then do commit and push procedure
# Else, skip it entirely.
if [[ -z "$skipCommit" ]]; then
  git diff HEAD~1 . | delta # show the changes between the current and the previous config version
  echo =============================
  echo 'Please enter a commit name? (keep empty for timestamp)' 
  read -p '> '  commitName
  if [[ ! -n "$commitName" ]]; then
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

