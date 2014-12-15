#!/bin/bash

PWD=`dirname $0`

exec carton exec -- start_server --port 5000  -- $PWD/app.sh 2>&1
