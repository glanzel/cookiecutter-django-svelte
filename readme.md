# Django - Svelte  Template [optional +Wagtail] 

State of the Art **django  svelte** [optional +Wagtail] template focused on code best-practices.

## Beta 
This is a beta version, as it is only a template. You can use it for a production website, but YMMV. It hasn't been extensively tested.

## Purpose
This cookiecutter template provides scaffolding for a Django+Svelte(+Wagtail) project.
It will likely work on Linux systems.

## Features
- Should be future proof - just upgrade Python, Django, Vite+Svelte, and Wagtail(optional) versions
- Supports python3.11+ and Django 5.0+
- Optional Wagtail integration
- Lightweight

### Dependencies
- [Django]()
- [Vite](https://github.com/vitejs/vite) Svelte project JS/TS/ES dependencie bundling (better than `webpack` or `Rollup`) 
- [Poetry](https://github.com/python-poetry/poetry) for managing django dependencies
- [django-environ](https://github.com/joke2k/django-environ) for 12 factor methology to configure django (and svelte)
- [whitenoise](https://github.com/evansd/whitenoise) pretty efficient self-contained  serving of static files 

- [wagtail](https://github.com/wagtail/wagtail)(optional) for a highly in django integrated cms

## Install
```bash
python3 -m pip install cookiecutter jinja2-git
cookiecutter https://github.com/glanzel/cookiecutter-django-svelte
```

## Run
### terminal 1
```bash
cd {{project_slug}}/frontend
npx vite build --watch
```

### terminal2
```bash
cd {{project_slug}}
poetry run python3 manage.py runserver
```

**You should now see the svelte App delivered by django runserver under localhost:8000**

## Directory structure
```
└── {{project_slug}}
    ├── backend
    │   ├── asgi.py
    │   ├── hello
    │   │   ├── migrations
    │   │   │   └── 0001_initial.py
    │   │   ├── models.py
    │   │   ├── serializers.py
    │   │   └── views.py
    │   ├── settings
    │   │   ├── defaults.py
    │   │   ├── logging.py
    │   │   ├── main.py
    │   │   └── mods.py
    │   ├── urls.py
    │   └── wsgi.py
    ├── db.sqlite3
    ├── djjs
    │   ├── apps.py
    │   ├── generated
    │   ├── settings.py
    │   ├── static
    │   ├── templates
    │   │   ├── base.html
    │   │   └── helloworld.html
    │   ├── urls.py
    │   └── views.py
    ├── frontend
    │   ├── index.html
    │   ├── jsconfig.json
    │   ├── package.json
    │   ├── package-lock.json
    │   ├── public
    │   │   └── vite.svg
    │   ├── README.md
    │   ├── src
    │   │   ├── app.css
    │   │   ├── App.svelte
    │   │   ├── assets
    │   │   │   └── svelte.svg
    │   │   ├── lib
    │   │   │   └── Counter.svelte
    │   │   └── vite-env.d.ts
    │   └── templates
    │       └── helloworld_assets.html
    ├── manage.py
    ├── poetry.lock
    ├── pyproject.toml
    └── tail
        ├── api.py
        ├── home
        │   ├── migrations
        │   │   ├── 0001_initial.py
        │   │   └── 0002_create_homepage.py
        │   ├── models.py
        │   ├── static
        │   │   └── css
        │   │       └── welcome_page.css
        │   └── templates
        │       └── home
        │           ├── home_page.html
        │           └── welcome_page.html
        ├── search
        │   ├── templates
        │   │   └── search
        │   │       └── search.html
        │   └── views.py
        ├── settings.py
        ├── static
        │   ├── css
        │   │   └── testtail.css
        │   └── js
        ├── templates
        │   ├── 404.html
        │   ├── 500.html
        │   └── base.html
        └── urls.py
```

- `backend/` - Django project (`settings.py`, `urls.py`, ``w``|``asgi.py`` and `hello/`) app
- `djjs/` - Django Rest Framework API for Django & Svelte javascript 
- `frontend/` - Svelte app
  - `public/` - external static assets (images)
  - `frontend/src/` - your Svelte code and assets
- `tail/` - Wagtail pages (``settings.py`` and `home` page Django templates)
- `tail/home` - Wagtail home page @ {{server_url}}/api/w2/

#### Svelte To Django
When builing Svelte via `npx vite build --watch` each input configured in frontend/vite.config.js becomes one bundle of assets in frontend/generated. (If you need more then one bundle of assets for a mpa just add several there) 
Each asset's bundle is integrated into Django inside the `djjs/` app via the {{your_page_name}}_assets.html file. So you can build a SPA (Single-Page App) or a mixed app with Django and Svelte together in the same directory. 
A fully working `helloworld` example app is included. 

#### Django directory structure 
This project separates the Wagtail project (`tail`) from the core Django project (`backend/` and `frontend/`).
Both apps have `urls.py` and `settings.py` files which can be plugged into the Django core backend or remain as separate projects.
If you want to switch to another frontend framework you can just replace ``djjs/generated`` and `frontend/` directories or even remove the whole `djjs` directory and build your frontend with Wagtail, for a more Wagtail-focused setup.   

## TODO
You can contribute by helping with:
- [ ] Documentation
- [ ] Cleanup
- [ ] Svelte routing (svelte-navigator ?)
- [ ] Convert shell installation script to Python for portability to non-Linux OSes
- [ ] Add linters to vite build (ruff? flake8? black? standardjs? eslint?)
- [ ] Add tests (pytest?)
- [ ] Optional Dockerfile
- [ ] Optional Kubernetes cluster config
- [ ] Optional `gitlab-ci.yaml`
- [ ] Add non-django server-side rendering? 


