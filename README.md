# docker_django_polls

This is a simple django polls app, dockerized, and using circleCI.

To start it:
docker-compose up

Navigate to localhost:8000/polls

To access the admin page and create new questions/choices, you need to create a superuser:
docker-compose run web python /srv/django-polls/manage.py createsuperuser

Navigate to localhost:8000/admin