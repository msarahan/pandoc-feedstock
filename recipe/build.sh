#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

mkdir -p ${PREFIX}/bin

if [ "$(uname)" == "Linux" ]; then
    mv bin/* ${PREFIX}/bin
fi


if [ "$(uname)" == "Darwin" ]; then
    pkgutil --expand pandoc.pkg pandoc
    cpio -i -I pandoc/pandoc.pkg/Payload
    cp usr/local/bin/pandoc ${PREFIX}/bin/
    cp usr/local/bin/pandoc-citeproc ${PREFIX}/bin/
fi
