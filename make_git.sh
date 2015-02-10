#!/bin/bash
#

#Crea un repositorio en GitHub acceos SSH

if test x = $1x ; then
  echo "No existe parametros"
  echo "$0 NOMBRE_REPOSITORIO"
  exit
fi

#Temporal
LOG=/tmp/runme.makegit

USUARIO=USER_GIT
PWD=PASS_GIT
NICK=NICK_GIT

echo curl -u "'${USUARIO}:${PWD}'" https://api.github.com/user/repos -d "'{\"name\":\"'$1'\",\"description\":\"Pendiente\"}'" > ${LOG}

bash ${LOG}

echo "# $1" >>README.md
git init
git add README.md
git commit -m "Iniciacion repositorio"
git remote add origin git@github.com:${NICK}/$1.git
git push origin master
