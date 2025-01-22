#!/bin/bash
DIR=$( dirname "$( realpath "$0" )" )
PARENT_DIR="$(dirname "$DIR")"
rm "$PARENT_DIR"/run.sh
