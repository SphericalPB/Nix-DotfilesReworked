#/bin/bash
nixDir="$HOME/.config/nixConf"
nixUser="sphericalpb"
nixHost="Spherical-Nix"

helpRebuild=""
updateFlakes=""
skipPush=""
skipCommit=""

function pushd() { builtin pushd "$1" > /dev/null; }
function popd() { builtin popd > /dev/null; }

function initialize() {
  pushd "$nixDir"
  alejandra .
  git add -N .
}

function rebuild() {
  if [[ -z "$homeRebuild" ]] then
    nh os switch ${updateFlakes:+-u} "$@" -H "$nixHost"
  else
    nh home switch ${updateFlakes:+-u} "$@" -c "$nixUser@$nixHost"
  fi
}

function helpPrint() {
  printf "%s\n\n" "rebuild-switch [-h|-a|-y|-s]"
  printf "%s\n" "-h | show list of a available flags" "-a | rebuild home-manager config" "-u | update flakes" "-y | skip push" "-s | skip git commit and push"
}

function separator() {
  width=$(tput cols)
  printf '%*s\n' "$width" '' | tr ' ' '='
}

while getopts "hauys" opt;do
  case $opt in
    h)
      helpPrint
      exit
      ;;
    a)
      homeRebuild="1"
      ;;
    u)
      updateFlakes="1"
      ;;
    y)
      skipPush="1"
      ;;
    s)
      skipCommit="1"
      ;;
    ?)
      helpPrint
      exit 1
      ;;
  esac
done

shift $((OPTIND - 1))

initialize
separator

if rebuild "$@"; then 
  if [[ -z "$skipCommit" ]]; then
    git diff -- . ':(exclude)flake.lock' | delta --features side-by-side
    separator
    echo "What do you call the commit? (keep empty for current timestamp)"
    read -p "> " commitName
    # Checks if the commit is blank or has been given a name.
    if [[ -z "$commitName" ]]; then
      commitName=$(date -u +%F_%H%M%S)
      separator
      printf " > %s\n > %s\n" "No input found" "Setting commit name to timestamp: \"$commitName\""
    fi
    separator
    echo " > Setting up git commit..."
    git commit -am "$commitName" 
    separator
    printf " > %s\n " "Successful commit: \"$commitName\""
    # If -y is ommited, skip push procedure
    if [[ -z "$skipPush" ]]; then
      echo "Do you want to push this repo? (y/N)"
      shopt -s nocasematch
      read -p "> " pushAction
      # default to no
      pushAction=${pushAction:-n}
      case "$pushAction" in
        [yY]) 
          git push
          ;;
        [nN]) 
          exit
          ;;
        *) 
          echo "Invalid input, please enter y or n."
          ;;
      esac
      separator
    fi
  else
    separator
    echo "Skipping commit and push procedures..."
  fi 
else
  echo "An error has occured during rebuild!"
fi
popd
