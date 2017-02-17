#!/bin/sh

ROLE_DIR=$1
ROLE_NAME=$(basename $ROLE_DIR)
SKELETON_DIR=$(dirname $0)
SKELETON_NAME="ansible-role-skeleton"

if [ ! -d "$ROLE_DIR" ]; then
  echo "The directory $ROLE_DIR must exist!"
  exit 1
fi

cp -r $SKELETON_DIR/.travis.yml $ROLE_DIR
cp -r $SKELETON_DIR/vagrant.yml $ROLE_DIR
cp -r $SKELETON_DIR/Vagrantfile $ROLE_DIR
cp -r $SKELETON_DIR/tests/* $ROLE_DIR/tests

perl -p -i -e "s/$SKELETON_NAME/$ROLE_NAME/" $ROLE_DIR/README.md $ROLE_DIR/vagrant.yml $ROLE_DIR/tests/test.yml
