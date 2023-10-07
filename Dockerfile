FROM python:3.9-alpine3.16

COPY requariments.txt /temp/requariments.txt
COPY service /service
WORKDIR /service
EXPOSE 8000
#SHELL ["/bin/bash", "-c"]
#
#ENV PYTHONDONTWRITEBYTECODE 1
#ENV PYTHONUNBUFFERED 1

RUN pip install -r /temp/requariments.txt
RUN pip install --upgrade pip

#RUN apt upgrade && apt -qy install gcc libjpeg-dev libxslt-dev \
#    libpq-dev libmariadb-dev libmariadb-dev-compat gettext cron openssh flake8 locales vim \
#
#RUN adduser -rms /bin/bash server-user && chmod 777 /opt /run
RUN adduser --disabled-password service-user
USER service-user

