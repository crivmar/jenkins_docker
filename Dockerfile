FROM python:3

MAINTAINER crivmar

WORKDIR /usr/src/app/

ADD django_tutorial /usr/src/app

RUN mkdir static && chmod +x /usr/src/app/cambios.bash && pip install django mysqlclient

ENV AUTORIZADOS=*

ENV HOST=mariadb

ENV USUARIO=django

ENV CONTRA=12345

ENV BD=django

ENV DJANGO_SUPERUSER_PASSWORD=12345

ENV DJANGO_SUPERUSER_USERNAME=admin

ENV DJANGO_SUPERUSER_EMAIL=admin@falso.es

CMD ["/usr/src/app/cambios.bash"]
