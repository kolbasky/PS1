#ONELINER
PROMPT_DIRTRIM=4;promptCommand(){ local TC=`printf "\xE2\x94\x8C"`;local BC=`printf "\xE2\x94\x94"`;local TREE=`printf "\xF0\x9F\x8C\xB4"`;local SNAKE=`printf "\xF0\x9F\x90\x8D"`;local BOLD="\[$(tput bold)\]";local DISCARD="\[$(tput sgr0)\]";local MAGENTA="\[$(tput setaf 5)\]";local BLUE="\[$(tput setaf 4)\]";local COLOR="\[$(tput setaf 1)\]";if [[ $(git branch 2>/dev/null) ]];then local GITSTATUS=`if [[ $(git status -bs 2>/dev/null | grep -cv '##') -gt 0 ]];then printf "*";fi`;local AHEADBEHIND=`git status -bs 2>/dev/null | head -n1 | grep -Eo 'ahead|behind' | sed 's/ahead/+/' | sed 's/behind/-/'| tr -d '\n'`;local BRANCH=`git branch 2>/dev/null | grep '^*' | tr -d '*' | cut -b 2-`;local GIT=`if [[ -n $BRANCH ]]; then printf "  ${MAGENTA}${TREE}${BRANCH}${AHEADBEHIND}${GITSTATUS}${DISCARD}"; fi`;fi;if [[ -n "$VIRTUAL_ENV" ]];then local PY=`which python`;local VENV=`printf "  ${BLUE}${SNAKE}v$(if [[ ! -z ${PY} ]];then python -V 2>&1 ; else python3 -V;fi | cut -b 8-10)-$(basename ${VIRTUAL_ENV})";`;fi;if [[ $TERM == "screen" ]];then local SCR=+;fi;export PS1="\n${COLOR}${TC}[\u@\h]-[\t]${VENV}${GIT}\n${COLOR}${BC}[\w]${SCR}\\$ ${DISCARD}"; };PROMPT_COMMAND=promptCommand;clear;history -d $(history 1)

#MULTILINE
promptCommand () { 
  local TC=$(printf "\xE2\x94\x8C");
  local BC=$(printf "\xE2\x94\x94");
  local TREE=$(printf "\xF0\x9F\x8C\xB4");
  local SNAKE=$(printf "\xF0\x9F\x90\x8D");
  local BOLD="\[$(tput bold)\]";
  local DISCARD="\[$(tput sgr0)\]";
  local MAGENTA="\[$(tput setaf 5)\]";
  local BLUE="\[$(tput setaf 4)\]";
  local COLOR="\[$(tput setaf 1)\]";
  if [[ $(git branch 2>/dev/null) ]];
  then
    local GITSTATUS=$(
      if [[ $(git status -bs 2>/dev/null | grep -cv '##') -gt 0 ]];
        then printf "*";
      fi;
    );
    local AHEADBEHIND=$(
      git status -bs 2>/dev/null | head -n1 | grep -Eo 'ahead|behind' | \
      sed 's/ahead/+/' | sed 's/behind/-/'| tr -d '\n'
    );
    local BRANCH=$(
      git branch 2>/dev/null | grep '^*' | tr -d '*' | cut -b 2-
    );
    local GIT=$(
      if [[ -n $BRANCH ]];
        then printf "  ${MAGENTA}${TREE}${BRANCH}${AHEADBEHIND}${GITSTATUS}${DISCARD}"; 
      fi;
    );
  fi;
  if [[ -n "$VIRTUAL_ENV" ]];
  then
    local PY=`which python`;
    local VENV=`
      printf "  ${BLUE}${SNAKE}v$(if [[ ! -z ${PY} ]];then python -V 2>&1 ; else python3 -V;fi | cut -b 8-10)-$(basename ${VIRTUAL_ENV})";
    `;
  fi;
  if [[ $TERM == "screen" ]];
  then 
    local SCR=+;
  fi;
  export PS1="\n${COLOR}${TC}[\u@\h]-[\t]${VENV}${GIT}\n${COLOR}${BC}[\w]${SCR}\\$ ${DISCARD}"; 
};
PROMPT_COMMAND=promptCommand;
history -d $(history 1)


