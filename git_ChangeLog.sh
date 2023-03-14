#!/bin/bash

## Usage:

### Get all commits from a specific release version to most recent release
### ./git_ChangeLog.sh 1.5_HotFix Release_Version

### Get all commits from a specific build version to the most recent build
### ./git_ChangeLog.sh 61

### Get all commits between the most recent build and the one before that
### ./git_ChangeLog.sh

if [ -z "$2" ]
then
	export TAGNAME=Build
else
	export TAGNAME=$2
fi


if [ -z "$1" ]
then
	export PREVIOUS_VERSION=$(git tag --sort v:refname | grep $TAGNAME | tail -2 | head -1)
else
	export PREVIOUS_VERSION=$(git tag --sort v:refname | grep $TAGNAME_$1 | head -1)
fi

export VERSION=$(git tag --sort v:refname | grep $TAGNAME | tail -1)

export CHANGES=$(git log --pretty="- %s" $VERSION...$PREVIOUS_VERSION)
printf "# Internal Release notes (\`$VERSION\`)\n\n## Changes\n$CHANGES\n\n## Metadata\n\`\`\`\nThis version -------- $VERSION\nPrevious version ---- $PREVIOUS_VERSION\nTotal commits ------- $(echo "$CHANGES" | wc -l)\n\`\`\`\n" > changeLog.md
markdown changeLog.md > changeLogTemp.html
sed 's:<p><code>:<p><pre>:g' changeLogTemp.html > changeLog.html
sed 's:</code></p>:</pre></p>:g' changeLog.html > changeLogTemp.html
cp -f changeLogTemp.html changeLog.html
rm changeLogTemp.html
rm changeLog.md

