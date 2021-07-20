#!/bin/bash

PIP3=$(which pip3)
PYTHON=$(which python3.9)

$pip3 install -r ./requirements.txt

gunicorn --bind 0.0.0.0:80 auth_site/auth_site/wsgi.py
