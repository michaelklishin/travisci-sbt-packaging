#!/bin/bash

WORK_DIR='target/tmp'

JAR_NAME='sbt-launch.jar'

function clean { rm -rf target; }

function prepare { rm -rf ${WORK_DIR}; mkdir -p ${WORK_DIR}; }

function replace_package_name { sed -i "s/PACKAGE_NAME/${PACKAGE_NAME}/g" ${@}; }

function jar_name { echo ${1} | sed 's|.*/\(.*.jar\).*|\1|g'; }

function replace_jar_name { sed -i "s/JAR_NAME/${JAR_NAME}/g" ${@}; }

function download_from {
  jar_link='http://typesafe.artifactoryonline.com/typesafe/ivy-releases/org.scala-sbt/sbt-launch/0.11.3/sbt-launch.jar'
  PACKAGE_NAME=sbt-0.11.3
  SBT_DIR=${WORK_DIR}/usr/lib/${PACKAGE_NAME}
  mkdir -p ${SBT_DIR}
  wget ${jar_link} -P ${SBT_DIR}
}

function build_package {
  cp -pr src/sbt ${SBT_DIR}
  cp -pr src/DEBIAN ${WORK_DIR}
  replace_package_name ${SBT_DIR}/sbt ${WORK_DIR}/DEBIAN/*
  replace_jar_name ${SBT_DIR}/sbt
  mv ${WORK_DIR} target/${PACKAGE_NAME}
  dpkg --build target/${PACKAGE_NAME}
}

clean

prepare
download_from ${SITE}
build_package
