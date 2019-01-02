#!/bin/bash
#
# (C) Canonical Ltd 2010
#
# Authored by: Neil Jagdish Patel <neil.patel@canonical.com>
#
# This script will make a release of unity-asset-pool
#
# Usage: ./release-me.sh VERSION

if [ -z $@ ]; then
  echo "Usage: ./release-me.sh VERSION"; exit
fi

VERSION=$@
PACKAGE=unity-asset-pool-$VERSION
TMPDIR=/tmp/$PACKAGE
TARBALL=$PACKAGE.tar.gz

echo "Committing and tagging release $VERSION"
bzr commit --unchanged -m"[release] $VERSION"
bzr tag $VERSION

echo "Branching for release"
bzr branch . $TMPDIR

echo "Cleaning up"
rm -rf $TMPDIR/.bzr*

echo "Creating archive"
cd /tmp
tar -cvzf $PACKAGE.tar.gz $PACKAGE
cd -
mv /tmp/$TARBALL .

echo "Signing archive"
gpg --armor --sign --detach-sig $PACKAGE.tar.gz

echo "Pushing release"
bzr push

echo "Done"
