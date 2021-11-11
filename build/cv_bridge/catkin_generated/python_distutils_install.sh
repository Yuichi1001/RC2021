#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/qudoudou/RC2021/src/cv_bridge"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/qudoudou/RC2021/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/qudoudou/RC2021/install/lib/python2.7/dist-packages:/home/qudoudou/RC2021/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/qudoudou/RC2021/build" \
    "/usr/bin/python2" \
    "/home/qudoudou/RC2021/src/cv_bridge/setup.py" \
     \
    build --build-base "/home/qudoudou/RC2021/build/cv_bridge" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/qudoudou/RC2021/install" --install-scripts="/home/qudoudou/RC2021/install/bin"
