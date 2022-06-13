#!/bin/sh

arch=amd64

echo -n "Language? ( 1-en_US.UTF-8 / 2-ru_RU.UTF-8 ) [1]: "
read item_locales
case "$item_locales" in
    1|en|EN|us|US|"") locales=en_US.UTF-8
        ;;
    2|ru|RU) locales=ru_RU.UTF-8
        ;;
    *) exit 0
        ;;
esac

echo -n "Keyboard? ( 1-us / 2-us,ru ) [1]: "
read item_kblayouts
case "$item_kblayouts" in
    1|us|US|"") kblayouts=us
        ;;
    2|ru|RU) kblayouts=us,ru
        ;;
    *) exit 0
        ;;
esac

SHAREDFOLDER=~/build_psiphon_lantern_live
DOCKERIMAGENAME=builder_psiphon_lantern_live
mkdir -p $SHAREDFOLDER 
docker run --privileged -it -v "$SHAREDFOLDER:/shared" -e user=$(id -u) -e group=$(id -g) -e arch=$arch -e locales=$locales -e kblayouts=$kblayouts --rm $DOCKERIMAGENAME 
