#!/bin/sh
#
# Opens a local document, using Google Docs.
#
# If the document does not exist on Google Docs, it is uploaded and opened. If
# the document already exists (filename matches exactly) then the existing
# document is opened.
#
# Requires googlecl. Written for Mac OS X.
#
# dan@dans.im
# 2010-09-29
#
# Edited by Werner Robitza
# 2011-06-15

if [ "$1" == "" ]; then
	echo "Usage: $0 <document>"
	exit 99
fi

DOCUMENT=$1

# Get document name and strip commas
DOCUMENT_NAME=$(basename "${1//,/ }")

# Strip the file extension from the end
DOCUMENT_NAME=${DOCUMENT_NAME%.*}

# Retrieve document info from Google Docs (if it exists)
DOCUMENT_GOOGLE=$(/usr/local/bin/google docs list url,title|grep "$DOCUMENT_NAME")

if [ ! -z "$DOCUMENT_GOOGLE" ]; then

	# Document exists already, open it
	URL=${DOCUMENT_GOOGLE%%,*}
	open $URL

else

	# Upload document - it doesn't exist
	UPLOAD_RESULT=$(/usr/local/bin/google docs upload "$DOCUMENT" 2>&1 |grep 'Upload success')

	# Open the newly uploaded document
	URL=${UPLOAD_RESULT##*Direct link: }
	open $URL
fi