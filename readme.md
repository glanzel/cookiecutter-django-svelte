# Django - Svelte  Template [optional +Wagtail] 

State of the Art **django  svelte** [optional +Wagtail] template focused on code quality.

## beta. 
as it is only a template you could use it in production anyway, but it needs a little more testing to finde out it works out of the boy under all circumstances. 

## Purpose

This project scaffolds a django svelte project structure.
It makes havvy use of cookiecutters scripting features, therefor it stays up to date
( but may only work on linux systems )

## Features

- Always up-to-date with the help of scripting 
- Supports latest python3.11+ and Django 4.1+
- pluggable wagtail an frontend integration
- Cutting Edge Tech Stack
- Slim. Features which come on Top of this stack are not intergrated so you are free to choose 

## Tech Stack

- [poetry](https://github.com/python-poetry/poetry) for managing django dependencies
- [environ](https://github.com/joke2k/django-environ) for 12 factor methology to configure django (and svelte)
- additional [wagtail](https://github.com/wagtail/wagtail) installation for a highly in django integrated cms
- [Vite](https://github.com/vitejs/vite) Up-To-Date Frontend Tooling fpr Svelte 


## Install
```
python3 -m pip install cookiecutter
cookiecutter [URL_OF_THIS_PROJECT]
```

### terminal 1
```
cd [project_slug]/frontend
npx vite build --watch
```

### terminal2
```
cd [project_slug]
poetry run python3 manage.py runserver
```

**You should now see the svelte App delivered by django runserver under localhost:8000**

## Structure
- frontend contains all svelte code. 

- backend contains the django main settings and application logic and serves the data per rest framework under [server_url]/api/dj/

- djjs is a django app which provides the generated svelte code via django server process and optionally django frontend code

- tail contains the wagtail. this aims to act as a better adminarea but can additionally aswell provide data for the frontend themself via [server_url]/api/w2/  

#### Svelte To Django
When builing Svelte via `npx vite build --watch` each input configured in frontend/vite.config.js becomes one bundle of assets in frontend/generate. (If you need more then one budles of asset for a mpa just add several there) 
Each assets bundle is integrated into django inside the djjs app via the [your_name]_assets.html file. So you can easily build a spa or a mixed app with frontend parts from django and svelte together. 
A fully working hello world example is included. 

#### Django Organisation 
I aim to Seperate django core (backend) from wagtail an django forntend app as good as possible. Therefore both apps provides urls and settings files which can be plugged into or apart from the core system easily. If you want to switch to another frontend framework you can just replace djjs/generated and frontend or even remove the whole djjs folder and build your frontend with wagtail for example if you want a more traditional django wagtail webapp.   

## more to come
if the template get used i will add additional features to it
- more dokumentation
- routing vor svelte (probably svelte-navigator)
- convert shell script to python for better portability
- add optional linters, testing tools and docker support
- server side rendering feature
 


