import os, environ
from backend.settings.main import INSTALLED_APPS, MIDDLEWARE, BASE_DIR

INSTALLED_APPS += [
    "rest_framework",
    "environ",
    "backend.hello",
]

env = environ.Env(
    # set casting, default value
    DEBUG=(bool, False)
)

# Take environment variables from .env file
environ.Env.read_env(os.path.join(BASE_DIR, '.env'))

# False if not in os.environ because of casting above
DEBUG = env('DEBUG')

# Raises Django's ImproperlyConfigured
# exception if SECRET_KEY not in os.environ
SECRET_KEY = env('SECRET_KEY')

# Parse database connection url strings
# like psql://user:pass@127.0.0.1:8458/db
DATABASES = {
    # read os.environ['DATABASE_URL'] and raises
    # ImproperlyConfigured exception if not found
    'default': env.db_url(
        'DATABASE_URL',
        default='sqlite:////tmp/my-tmp-sqlite.db'
    )
}