#! /bin/bash

if [ "$IS_PRIMARY" == "true" ]; then
  litefs import -name data.db /home/node/code/data.db
fi

