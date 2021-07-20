#!/bin/bash

PIP3=$(which pip3)
PYTHON=$(which python3.9)

if [ ! -f $PIP3 ]; then
    echo "pip3 ($PIP3) cannot be found! Cannot proceed."
    exit 1
fi

if [ ! -f $PYTHON ]; then
    echo "python 3.9 ($PYTHON) cannot be found! Cannot proceed."
    exit 1
fi

PWD=$(dirname $0)
REQS=$PWD/requirements.txt

echo "PWD=$PWD"
echo "REQS=$REQS"

if [ ! -f $REQS ]; then
    echo "Requirements.txt ($REQS) not found! Cannot proceed."
    exit 1
fi

echo "$PIP3 install -r $REQS"
$PIP3 install -r $REQS

GUNICORN=$(which gunicorn)

if [ ! -f $GUNICORN ]; then
    echo "GUNICORN ($GUNICORN) not found! Cannot proceed."
    exit 1
fi

WSGI=auth_site.wsgi:application

export DJANGO_SETTINGS_MODULE=auth_site.settings

cd $PWD/auth_site
echo $(pwd)
$GUNICORN --bind 0.0.0.0:80 $WSGI
