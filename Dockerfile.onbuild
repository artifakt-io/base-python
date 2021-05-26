FROM registry.artifakt.io/python:3.9

WORKDIR /var/www/html/

# Install app dependencies
# A wildcard is used to ensure copy does not fail
# when requirements unavailable
COPY requirements.* ./

# dependency management
RUN if [ -f requirements.txt ]; then pip install --no-cache-dir -r requirements.txt; fi

COPY --chown=www-data:www-data . /var/www/html

# copy the artifakt folder on root
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
COPY . .
RUN  if [ -d .artifakt ]; then cp -rp /var/www/html/.artifakt /.artifakt/; fi

# PERSISTENT DATA FOLDERS
# standard, no specifics

# run custom scripts build.sh
# hadolint ignore=SC1091
#RUN --mount=source=artifakt-custom-build-args,target=/tmp/build-args \
RUN    if [ -f /tmp/build-args ]; then source /tmp/build-args; fi && \
    if [ -f /.artifakt/build.sh ]; then /.artifakt/build.sh; fi

CMD ["python", "server.py"]