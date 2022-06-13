#!/bin/sh
cd $(dirname "$0")/files
DOCKERIMAGENAME=builder_psiphon_lantern_live
docker build --no-cache --pull -t $DOCKERIMAGENAME .
#docker build -t $DOCKERIMAGENAME .
