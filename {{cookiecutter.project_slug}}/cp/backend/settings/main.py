from .defaults import *
from .logging import *
from .mods import *

try:
	from djjs.settings import *
except ImportError or ModuleNotFoundError:
    print('No Module settings in djjs')

try:
	from tail.settings import *
except ImportError or ModuleNotFoundError:
    print('No Module settings in tails')
