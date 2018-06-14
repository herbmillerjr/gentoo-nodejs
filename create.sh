#!/bin/bash

set -ex

HOME=`npm view ${1} | grep homepage: | awk -F\' '{print $2}' | sed s#https://github.com/## | cut -d# -f1`
OWNER=${HOME%%/*}
PACKAGE=$1
VERSION=`npm view ${1} | grep version: | awk -F\' '{print $2}'`

CONTENT_FILE=/tmp/content
curl https://api.github.com/repos/${HOME}/contents/package.json?ref=${VERSION} | jq -r '.content' > ${CONTENT_FILE}
if [ $(head -1 $CONTENT_FILE) == "null" ]; then
	curl https://api.github.com/repos/${HOME}/contents/package.json?ref=v${VERSION} | jq -r '.content' > ${CONTENT_FILE}
	VERSION_PREFIX="v"
fi
REPO_INFO=`cat $CONTENT_FILE | base64 --decode`
LICENSE=`echo $REPO_INFO | jq -r '.license'`
MAIN=`echo $REPO_INFO | jq -r '.main'`
DESCRIPTION=`echo $REPO_INFO | jq -r '.description' | cut -d. -f1 | sed 's/\`//g'`

PACKAGE_DIR=dev-nodejs/${PACKAGE/./-}
mkdir -p ${PACKAGE_DIR}

EBUILD_FILENAME=${PACKAGE/./-}-${VERSION}.ebuild
EBUILD=${PACKAGE_DIR}/${EBUILD_FILENAME}
cp template.ebuild ${EBUILD}
sed -i "s/<LICENSE>/${LICENSE}/" ${EBUILD}
sed -i "s/<MAIN>/${MAIN}/" ${EBUILD}
sed -i "s#<REPO>#${HOME}#" ${EBUILD}
sed -i "s/<AUTHOR>/${OWNER}/" ${EBUILD}
sed -i "s#<DESCRIPTION>#${DESCRIPTION}#" ${EBUILD}
sed -i "s/<VERSION_PREFIX>/${VERSION_PREFIX}/" ${EBUILD}

DEPENDENCIES_FILE=/tmp/dependencies
echo $REPO_INFO | jq -r '.dependencies' > $DEPENDENCIES_FILE
GENTOO_DEPENDENCIES_FILE=/tmp/gentoo_dependencies
PACKAGES_FILE=/tmp/packages
if [ $(head -1 $DEPENDENCIES_FILE) != "null" ]; then
	if [ -f $PACKAGES_FILE ]; then
		rm $PACKAGES_FILE
	fi
	if [ -f $GENTOO_DEPENDENCIES_FILE ]; then
		rm $GENTOO_DEPENDENCIES_FILE
	fi
	for DEPENDENCY in `echo $REPO_INFO | jq -r '.dependencies|keys[]'`; do
		REAL_DEPENDENCY_NAME=`npm view ${DEPENDENCY} | grep homepage: | awk -F\' '{print $2}' | sed s#https://github.com/## | cut -d# -f1 | cut -d/ -f2 | sed 's/\./-/'`
		DEPENDENCY_VERSION=`echo $REPO_INFO | jq -r ".dependencies|.\"$DEPENDENCY\""`
		if echo DEPENDENCY_VERSION | grep -q "^"; then
			sed -i -r "s#(<DEPENDENCIES>)#\n\t>=dev-nodejs/${REAL_DEPENDENCY_NAME}-${DEPENDENCY_VERSION##^}\1#" ${EBUILD}
		else
			sed -i -r "s#(<DEPENDENCIES>)#\n\tdev-nodejs/${REAL_DEPENDENCY_NAME}\1#" ${EBUILD}
		fi
	done
fi
sed -i "s/<DEPENDENCIES>//" ${EBUILD}

cp metadata.xml ${PACKAGE_DIR}
sed -i "s#UPSTREAM#${HOME}#" ${PACKAGE_DIR}/metadata.xml

pushd ${PACKAGE_DIR}
ebuild ${EBUILD_FILENAME} manifest
