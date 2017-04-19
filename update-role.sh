#!/bin/sh

ROLE_DIR=$1
ROLE_NAME=$(basename $ROLE_DIR)
SKELETON_DIR=$(dirname $0)
SKELETON_NAME="ansible-role-skeleton"

absent="vagrant.yml Vagrantfile tests/inventory"
present=".travis.yml molecule.yml tox.ini tests"

if [ ! -d "$ROLE_DIR" ]; then
  echo "The directory $ROLE_DIR must exist!"
  exit 1
fi

for file in $absent; do
  if [ -e ${ROLE_DIR}/${file} ]; then
    rm ${ROLE_DIR}/${file}
  fi
done

for file in $present; do
  if [ ! -e ${ROLE_DIR}/${file} ]; then
    cp -r ${SKELETON_DIR}/${file} ${ROLE_DIR}/
  fi
done

perl -p -i -e "s/$SKELETON_NAME/$ROLE_NAME/" $ROLE_DIR/README.md $ROLE_DIR/molecule.yml $ROLE_DIR/tests/test.yml
