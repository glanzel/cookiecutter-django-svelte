import os
from backend.settings.main import INSTALLED_APPS, MIDDLEWARE, BASE_DIR

INSTALLED_APPS += [
    "tail",
    "tail.home",
    "tail.search",
    "wagtail.contrib.forms",
    "wagtail.contrib.redirects",
    "wagtail.embeds",
    "wagtail.sites",
    "wagtail.users",
    "wagtail.snippets",
    "wagtail.documents",
    "wagtail.images",
    "wagtail.search",
    "wagtail.admin",
    "wagtail",
    "modelcluster",
    'wagtail.api.v2',
    "taggit",
]

MIDDLEWARE += [
    "wagtail.contrib.redirects.middleware.RedirectMiddleware",
]

MEDIA_ROOT = os.path.join(BASE_DIR, "media")
MEDIA_URL = "/media/"


WAGTAIL_SITE_NAME = "testtail"

WAGTAILSEARCH_BACKENDS = {
    "default": {
        "BACKEND": "wagtail.search.backends.database",
    }
}

WAGTAILADMIN_BASE_URL = "http://example.com"

