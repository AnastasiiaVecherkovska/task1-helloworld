#!/bin/bash
DIR=$( dirname "$( realpath "$0" )" )

activate_scripts() {
  chmod 0700 "$DIR"/setup.sh
  chmod 0700 "$DIR"/cleanup.sh
}

execute_scripts() {
  sh "$DIR"/setup.sh
  sh run.sh
  sh "$DIR"/cleanup.sh
}

main() {
  activate_scripts
  execute_scripts
}

main
