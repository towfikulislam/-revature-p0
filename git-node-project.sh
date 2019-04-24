#!/bin/bash
## checking if linux envirnment is setup with node based project

## verify gcc
if [ -z $(which gcc) ]; then
    brew install gcc
  else echo "gcc exists"
fi

## verify git
if [ -z $(which git) ]; then
    brew install git
  else echo "git exists"
fi

## verify azure-cli
if [ -z $(which az) ]; then
    brew install azure-cli
  else echo "azure exists"
fi

## verify node
if [ -z $(which node) ]; then
    brew install node
  else echo "node exists"
fi

gitproject=$1

## makes the directory 
if ! [ -d $gitproject ]; then   
    mkdir $gitproject
  echo "directory created"
fi

## checks if directory is empty or not
if [ -z "$(ls -a $gitproject)" ]; then
      echo "empty directory"
   exit 1
fi

## directory creation
    mkdir $gitproject/.docker

    touch \
    $gitproject/.docker/dockerfile \
    $gitproject/.docker/dockerup.yaml

    ## github
    mkdir -p \
    $gitproject/.github/ISSUE_TEMPLATE \
    $gitproject/.github/PULL_REQUEST_TEMPLATE

    touch \
    $gitproject/.github/ISSUE_TEMPLATE/issue-template.md \
    $gitproject/.github/PULL_REQUEST_TEMPLATE/pull-request-template.md

    touch \
    $gitproject/.github/CODE-OF-CONDUCT.md \
    $gitproject/.github/CONTRIBUTING.md

    ## root
    mkdir \
    $gitproject/client \
    $gitproject/src \
    $gitproject/test

    touch \
    $gitproject/client/.gitkeep \
    $gitproject/src/.gitkeep \
    $gitproject/test/.gitkeep

    touch \
    $gitproject/.azureup.yaml \
    $gitproject/.dockerignore \
    $gitproject/.editorconfig \
    $gitproject/.gitignore \
    $gitproject/.markdownlint.yaml \
    $gitproject/CHANGELOG.md \
    $gitproject/LICENSE.txt \
    $gitproject/README.md

## convert to git repository and initiate git
    git init
    $ git config --global user_name 
    $ git config --global user_email

## enforce node as project runtime and created packet jason
    npm init

fi

exit 0
