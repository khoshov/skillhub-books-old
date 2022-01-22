#!/bin/sh

python manage.py migrate
python manage.py collectstatic --noi -v 0

gunicorn config.wsgi:application --bind 0.0.0.0:8000
