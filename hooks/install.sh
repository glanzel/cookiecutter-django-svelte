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

while getopts 'wh' OPTION; do
  case "$OPTION" in
    w)
			wagtail=true
      echo "Installing Wagtail"
      ;;
    h)
      exit 1;;
    ?)
      exit 1;;
  esac
done

echo ""
echo "This script will setup an Django-Svelte or Wagtail Svelte project for you." 
echo "It Uses poetry and install it systemwide. All other suff happens inside"
echo "the projectdirectory"
echo ""
echo "****************************************************"
echo ""

exit

python3 -m pip install poetry
poetry config virtualenvs.in-project true
if [ $1 ]
then
   foldername=$1
else
   echo "Please type the root foldername of your project"
   read foldername
fi
mkdir $foldername
cd $foldername
poetry init -n --description "Django Svelte Project"
poetry add django whitenoise
poetry add --group dev black 
poetry add django-rest-framework
poetry add django-cors-headers

appname="backend_base"

if $wagtail
then
	poetry add wagtail
	poetry run wagtail start $appname .
else
	poetry run django-admin startproject $appname .
fi

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

# npx degit sveltejs/template frontend
# sveltejs/template is unmaintained. Probably switch to something newer. In the meantime update by hand: 

cd frontend
# TODO: make the setup working after updating take a look here: https://betterprogramming.pub/how-to-update-rollup-to-version-3-10c59139cbeb
#npm uninstall rollup-plugin-terser
#npm install @rollup/plugin-terser --save-dev
#npm install npm-check-updates --save-dev
#ncu -u
npm install

cd ..

cp ../djangoSvelteSetupScript/frontend/rollup.config.js frontend/


echo ""
echo "****************************************************"
echo ""
echo "Svelte is installed."
echo ""
echo "Now configuring the django spa view."
echo ""
echo "****************************************************"
echo ""

poetry run django-admin startapp spa

mkdir spa/templates/assets
mv frontend/public/favicon.png spa/templates/assets/
mv frontend/public/global.css spa/templates/assets/

cp $SCRIPTPATH/backend/spa/ backend/spa/ -r
cp $SCRIPTPATH/backend/setttings.py backend/





