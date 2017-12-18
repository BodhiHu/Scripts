#!/bin/bash

#list available jdks
alias jdks="/usr/libexec/java_home -V"
# jdk version switching - e.g. `jdk 6` will switch to version 1.6
function jdk_env() {
  printf "\nSwitching java version $1 =>\n";

  requestedVersion=$1
  oldStyleVersion=8
  # Set the version
  if [ $requestedVersion -gt $oldStyleVersion ]; then
    export JAVA_HOME=$(/usr/libexec/java_home -v $1);
  else
    export JAVA_HOME=`/usr/libexec/java_home -v 1.$1`;
  fi

  printf "Setting JAVA_HOME=$JAVA_HOME\n"

  printf "\nwhich java =>\n"
  which java
  printf "\njava -version =>\n"
  java -version;

  printf "\nDone\n"
}

jdk_env $1

