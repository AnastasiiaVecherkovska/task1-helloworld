#!/bin/bash
DIR=$( dirname "$( realpath "$0" )" )

activate_scripts() {
  chmod 0700 "$DIR"/setup.sh
  chmod 0700 "$DIR"/cleanup.sh
}

check_class_files_presence() {
  PARENT_DIR="$(dirname "$DIR")"

  HELLO_ANONYMOUS="$PARENT_DIR"/out/HelloAnonymousWorld.class
  HELLO_WORLD="$PARENT_DIR"/out/efs/manyfiles/HelloWorld.class
  HELLO_USED="$PARENT_DIR"/out/efs/manyfiles/UsedByHelloWorld.class

  FILES="$HELLO_ANONYMOUS $HELLO_ONE $HELLO_WORLD $HELLO_USED"

  for FILE in $FILES
  do
    if [ ! -f "$FILE" ]; then
      echo "$FILE is not present"
      sh "$DIR"/cleanup.sh
      exit 1
    fi
  done
}

execute_test() {
  sh "$DIR"/setup.sh
  sh run.sh >/dev/null
  check_class_files_presence
  sh "$DIR"/cleanup.sh
}

main(){
  activate_scripts
  execute_test
}

main
