#!/bin/bash

# merge folders
cp cp/* . -r
rm cp -r

# move settings to defaults
mv backend/settings.py backend/settings/defaults.py 

#process django
poetry run python3 manage.py makemigrations hello
poetry run python3 manage.py migrate
poetry run python3 manage.py shell -c 'from backend.hello.models import Hello
Hello.objects.create(content="Hello Svelte, Hi Django. Whats going on ?")'

exit 0



