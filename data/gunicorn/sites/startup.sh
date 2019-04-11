#!/bin/bash
cd /var/www/python/sscmspy
export FLASK_APP=main.py
flask run -p 5000 -h 0.0.0.0
