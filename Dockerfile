############################################################
# Dockerfile to run a Django-based web application
# Based on a Python image
############################################################

# Set the base image to use to Python
FROM python:2.7
ENV PYTHONUNBUFFERED 1

# Set the file maintainer (your name - the file's author)
MAINTAINER Bobby Battista

# Set env variables used in this Dockerfile (add a unique prefix, such as DOCKYARD)
# Local directory with project source
ENV POLLS_SRC=django-polls
# Directory in container for all project files
ENV POLLS_SRVHOME=/srv

# Directory in container for project source files
ENV POLLS_SRVPROJ=/srv/django-polls

# Create application subdirectories
WORKDIR $POLLS_SRVHOME
RUN mkdir logs

# Install requirements
COPY $POLLS_SRC/requirements.txt $POLLS_SRVPROJ/requirements.txt
RUN pip install -r $POLLS_SRVPROJ/requirements.txt

VOLUME ["$POLLS_SRVHOME/logs/"]

# Port to expose
EXPOSE 8000

# Copy entrypoint script into the image
# WORKDIR $POLLS_SRVPROJ
# COPY ./docker-entrypoint.sh /
# ENTRYPOINT ["/docker-entrypoint.sh"]