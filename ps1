#!/bin/bash

HG_BRANCH=`hg branch 2>&1`
if [[ $? == 0 ]]
then
  VCS_PROMPT="\[\033[00;33m\](\[\033[00;37m\]$HG_BRANCH\[\033[00;33m\]) \[\033[01;34m\]"
else
  VCS_PROMPT=""
fi

GIT_BRANCH=`git branch 2>&1 | grep \* | cut -d ' ' -f 2`
if [[ -z "$VCS_PROMPT" && -n "$GIT_BRANCH" ]]
then
  VCS_PROMPT="\[\033[00;33m\](\[\033[00;37m\]$GIT_BRANCH\[\033[00;33m\]) \[\033[01;34m\]"
fi

if [[ -e $VIRTUAL_ENV ]]
then
  ENVNAME=`echo $VIRTUAL_ENV | cut -d / -f 5`
VENV_PROMPT="\[\033[00;33m\][\[\033[00;37m\]$ENVNAME\[\033[00;33m\]] "
else
  VENV_PROMPT=""
fi

export PS1="$VENV_PROMPT\[\033[01;32m\]\u@\h\[\033[01;34m\] \w $VCS_PROMPT$ \[\033[00m\]"
