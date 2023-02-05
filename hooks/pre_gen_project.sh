#!/bin/bash
echo ""
echo "****************************************************"
echo ""
echo "usage: install.sh [project-name] [-wh]"
echo "-w install wagtail and uses the wagtail folder structure"
echo "-h help -> this page"
echo ""
echo "****************************************************"

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

wagtail=false

echo ""
echo "This script will setup an Django-Svelte or Wagtail Svelte project for you." 
echo "It Uses poetry and install it systemwide. All other suff happens inside"
echo "the projectdirectory"
echo ""
echo "****************************************************"
echo ""

python3 -m pip install --upgrade pip
python3 -m pip install poetry
poetry config virtualenvs.in-project true
poetry init -n --description "Django Svelte Project"
poetry add django whitenoise
poetry add --group dev black 
poetry add djangorestframework
poetry add django-cors-headers
poetry add django-environ

appname="backend"
add_wagtail={{cookiecutter.add_wagtail}}
echo $add_wagtail

if [ "$add_wagtail" == "y" ]
then
	poetry add wagtail
	#poetry run wagtail start $appname .
else
	echo "do nothing"
fi

poetry run django-admin startproject $appname .


mkdir -p $appname/static/frontend
echo ""
echo "****************************************************"
echo ""
echo "Django / Wagtail  is installed."
echo ""
echo "Now installing svelte."
echo ""
echo "****************************************************"
echo ""

npm create vite@latest frontend -- --template svelte

cd frontend
npm install
cd ..


echo ""
echo "****************************************************"
echo ""
echo "Svelte is installed."
echo ""
echo "Now configuring the django djjs view."
echo ""
echo "****************************************************"
echo ""

mkdir -p djjs/static
mv frontend/public/favicon.png djjs/static
mv frontend/public/global.css djjs/static

exit 0




