#!/bin/bash
DIR=$( dirname "$( realpath "$0" )" )
PARENT_DIR="$(dirname "$DIR")"

check_txt_presence() {
  FILE="$PARENT_DIR"/run.txt
  if [ ! -f "$FILE" ]; then
    echo "$FILE is not present"
    exit 1
  fi
}

parse_txt_to_sh() {
  FILE_CONTENT=$(cat "$FILE")
  touch "$PARENT_DIR"/run.sh
  echo "#!/bin/bash" >> "$PARENT_DIR"/run.sh
  echo "$FILE_CONTENT" >> "$PARENT_DIR"/run.sh
}

main() {
  check_txt_presence
  parse_txt_to_sh
  chmod 0700 "$PARENT_DIR"/run.sh
}

main
