#! /bin/bash

# Espera un poco mientras se monta el escenario

sleep 25

# Crea una nueva migración

python3 manage.py makemigrations

# Hace la migración

python3 manage.py migrate

# Crea un superusuario

python3 manage.py createsuperuser --noinput

# Reune en una misma carpeta todo el contenido estático

python3 manage.py collectstatic --no-input

# En que puerto va a estar escuchando peticiones

python3 manage.py runserver 0.0.0.0:9000
