#!/bin/bash

set -ex

DIR=$(cd $(dirname $0) && pwd)
exec carton exec -- plackup -E production -s Starlet --max-worker=5 --max-reqs-per-child=10 --min-reqs-per-child=10 -a $DIR/../app.psgi
