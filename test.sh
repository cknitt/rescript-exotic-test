#!/usr/bin/env bash

set -e

unamestr=$(uname)

if [ "$unamestr" = 'FreeBSD' ]; then
    # Node 16 doesn't work, see https://forums.freebsd.org/threads/nodejs-and-libcrypto-so-wrong-version-after-upgrade.82471/
    # sudo pkg install -y npm-node14 python gcc
    sudo pkg install -y npm-node14 python gcc
elif [ "$unamestr" = 'OpenBSD' ]; then
    sudo pkg_add node python-3.9.13 g++-11.2.0p2
    sudo ln -sf /usr/local/bin/python3 /usr/local/bin/python

    export CXX=eg++ 
fi

npm i rescript.tgz
npm test

# Cleanup
rm -rf node_modules
