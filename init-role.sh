#!/bin/sh

ROLE_DIR=$1
ROLE_NAME=$(basename $ROLE_DIR)
SKELETON_DIR=$(dirname $0)
SKELETON_NAME="ansible-role-skeleton"

if [ -d "$ROLE_DIR" ]; then
  echo "The directory $ROLE_DIR already exists!"
  exit 1
fi

mkdir $ROLE_DIR
cp -r $SKELETON_DIR $ROLE_DIR
rm -rf $ROLE_DIR/.git $ROLE_DIR/.vagrant $ROLE_DIR/init-role.sh $ROLE_DIR/update-role.sh
perl -p -i -e "s/$SKELETON_NAME/$ROLE_NAME/" $ROLE_DIR/README.md $ROLE_DIR/molecule.yml $ROLE_DIR/tests/test.yml
