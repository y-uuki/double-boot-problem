#!/bin/bash

set -ex

exec $CPAN_INSTALL_PATH/bin/plackup -E production -s Starlet --max-worker=5 --max-reqs-per-child=1000000 --min-reqs-per-child=1000000 -a $APPROOT/app.psgi
